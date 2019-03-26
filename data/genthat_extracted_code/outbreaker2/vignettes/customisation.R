## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", 
  fig.width=8, 
  fig.height=5, 
  fig.path="figs-customisation/"
)

## ---- f_pi---------------------------------------------------------------
f <- function(pi) {
    ifelse(pi < 0.8, 0, 5)
}

f_pi <- function(param) { 
    log(f(param$pi))
}

plot(f, type = "s", col = "blue", 
     xlab = expression(pi), ylab = expression(p(pi)), 
     main = expression(paste("New prior for ", pi)))


## ---- custom_prior-------------------------------------------------------
library(outbreaker2)

f_mu <- function(param) {
  if (param$mu < 0 || param$mu > 1) {
    return(-Inf)
  } else {
    return(0.0)
  }
  
}

priors <- custom_priors(pi = f_pi, mu = f_mu)
priors


## ---- wrong_prior, error = TRUE------------------------------------------

## wrong: not a function
## should be pi = function(x){0.0}
custom_priors(pi = 0.0)

## wrong: two arguments
custom_priors(pi = function(x, y){0.0})


## ---- run_custom_priors--------------------------------------------------

dna <- fake_outbreak$dna
dates <- fake_outbreak$sample
w <- fake_outbreak$w
data <- outbreaker_data(dna = dna, dates = dates, w_dens = w)

## we set the seed to ensure results won't change
set.seed(1)


res <- outbreaker(data = data, priors = priors)


## ---- traces_custom_priors-----------------------------------------------

plot(res)
plot(res, "pi", burnin = 500)
plot(res, "mu", burnin = 500)
plot(res, "pi", type = "density", burnin = 500)
plot(res, "mu", type = "hist", burnin = 500)


## ---- tree_custom_priors-------------------------------------------------

summary(res, burnin = 500)
tree <- summary(res, burnin = 500)$tree

comparison <- data.frame(case = 1:30,
                       	 inferred = paste(tree$from),
			 true = paste(fake_outbreak$ances),
			 stringsAsFactors = FALSE)
			 
comparison$correct <- comparison$inferred == comparison$true
comparison
mean(comparison$correct)


## ---- likelihood_components----------------------------------------------

custom_likelihoods()


## ---- wrong_likelihood, error = TRUE-------------------------------------

## wrong: not a function
custom_likelihoods(genetic = "fubar")

## wrong: only one argument
custom_likelihoods(genetic = function(x){ 0.0 })


## ---- null_model---------------------------------------------------------

f_null <- function(data, param) {
   return(0.0)
}

null_model <- custom_likelihoods(genetic = f_null,
                                 timing_sampling = f_null,
                                 timing_infections = f_null,
                                 reporting = f_null,
                                 contact = f_null)

null_model


## ---- run_null_model, cache = TRUE---------------------------------------

null_config <- list(find_import = FALSE,
n_iter = 500,
sample_every = 1)

set.seed(1)

res_null <- outbreaker(data = data,
config = null_config,
likelihoods = null_model)


## ---- res_null_model-----------------------------------------------------

plot(res_null)
plot(res_null, "pi")
plot(res_null, "mu")


## ---- null_trees---------------------------------------------------------

plot(res_null, type = "alpha")


## ---- null_net-----------------------------------------------------------

## extract nodes and edges from the visNetwork object
temp <- plot(res_null, type = "network", min_support = 0)
class(temp)
head(temp$x$edges)
head(temp$x$nodes)

## make an igraph object
library(igraph)

net_null <- graph.data.frame(temp$x$edges,
                             vertices = temp$x$nodes[1:4])

plot(net_null, layout = layout.circle,
     main = "Null model, posterior trees")


## ---- res_null_diag------------------------------------------------------

plot(res_null, type = "kappa")
plot(res_null, type = "t_inf")


## ---- res_null_priors----------------------------------------------------

par(xpd=TRUE)
hist(res_null$mu, prob = TRUE, col = "grey",
     border = "white",
     main = "Distribution of mu")

invisible(replicate(30,
     points(density(rexp(500, 1000)), type = "l", col = "blue")))


hist(res_null$pi, prob = TRUE, col = "grey",
     border = "white", main = "Distribution of pi")

invisible(replicate(30,
     points(density(rbeta(500, 10, 1)), type = "l", col = "blue")))


## ---- wt_custom----------------------------------------------------------

onset_data <- outbreaker_data(dates = fake_outbreak$onset,
	      	              w_dens = fake_outbreak$w)

wt_model <- custom_likelihoods(timing_sampling = f_null,
                               reporting = f_null)


## ---- wt_config----------------------------------------------------------

wt_config <- create_config(init_kappa = 1, move_kappa = FALSE,
                           init_pi = 1, move_pi = FALSE,
                           move_mu = FALSE)


## ---- run_wt, cache = TRUE-----------------------------------------------

set.seed(1)
res_wt <- outbreaker(data = onset_data,
                     config = wt_config,
                     likelihoods = wt_model)
		       

## ---- res_wt-------------------------------------------------------------

plot(res_wt)
plot(res_wt, burnin = 500)
plot(res_wt, burnin = 500, type = "alpha")
summary(res_wt)


## ---- wt_net-------------------------------------------------------------

## extract nodes and edges from the visNetwork object
temp <- plot(res_wt, type = "network", min_support = 0.05)
class(temp)
head(temp$x$edges)
head(temp$x$nodes)

## make an igraph object

net_wt <- graph.data.frame(temp$x$edges,
                             vertices = temp$x$nodes[1:4])
			     
plot(net_wt, layout = layout.circle,
     main = "WT model, posterior trees")


## ---- move_defaults------------------------------------------------------

lapply(custom_moves(),  args)


## ---- custom_move_mu-----------------------------------------------------

move_mu <- function(param, config) {

  NEW_MOVE_HAS_BEEN_USED <<- TRUE
  param$mu <- rexp(1, 1000)  
  return(param)
  
}

moves <- custom_moves(mu = move_mu)

quick_config <- list(n_iter = 500, sample_every = 1, find_import = FALSE)


## ---- bind_moves---------------------------------------------------------

## bind quick_config to function
move_mu_intern <- bind_to_function(move_mu, config = quick_config)

## new function has just one argument
move_mu_intern

## 'config' is in the function's environment
names(environment(move_mu_intern))

## 'config' is actually 'quick_config'
identical(environment(move_mu_intern)$config, quick_config)


## ---- run_custom_move_mu-------------------------------------------------

NEW_MOVE_HAS_BEEN_USED <- FALSE

set.seed(1)
res_move_mu <- outbreaker(data, quick_config, moves = moves)
NEW_MOVE_HAS_BEEN_USED

plot(res_move_mu)
plot(res_move_mu, "pi")
plot(res_move_mu, "mu")


## ---- new_move_ances-----------------------------------------------------

api <- get_cpp_api()

new_move_ances <- function(param, data, custom_likelihoods = NULL) {

for (i in 1:data$N) {
    current_ances <- param$alpha[i]
    if (!is.na(current_ances)) {
      ## find cases infected on the same days
      current_t_inf <- param$t_inf[current_ances]
      pool <- which(param$t_inf == current_t_inf)
      pool <- setdiff(pool, i)
      
      if (length(pool) > 0) {
        ## propose new ancestor
        current_ll <- api$cpp_ll_all(data, param, i = i, custom_likelihoods)
        param$alpha[i] <- sample(pool, 1)
        new_ll <- api$cpp_ll_all(data, param, i = i, custom_likelihoods)

        ## likelihood ratio - no correction, move is symmetric
        ratio <- exp(new_ll - current_ll)

        ## accept / reject
        if (runif(1) <= ratio) { # accept
          N_ACCEPT <<- N_ACCEPT + 1
        } else { # reject
          N_REJECT <<- N_REJECT + 1
          param$alpha[i] <- current_ances
        }
      }
    }
  }
  return(param)
}

moves <- custom_moves(new_move = new_move_ances)


## ---- run_new_move, cache = TRUE-----------------------------------------

N_ACCEPT <- 0
N_REJECT <- 0

set.seed(1)
res_new_move <- outbreaker(data, list(move_kappa = FALSE), moves = moves)

N_ACCEPT
N_REJECT


## ---- res_new_move-------------------------------------------------------

plot(res_new_move)
plot(res_new_move, type = "alpha")
summary(res_new_move)


## ---- check_new_move-----------------------------------------------------

summary(res_new_move, burnin = 5000)
tree2 <- summary(res_new_move, burnin = 5000)$tree

comparison <- data.frame(case = 1:30,
                       	 inferred = paste(tree2$from),
			 true = paste(fake_outbreak$ances),
			 stringsAsFactors = FALSE)
			 
comparison$correct <- comparison$inferred == comparison$true
comparison
mean(comparison$correct)


