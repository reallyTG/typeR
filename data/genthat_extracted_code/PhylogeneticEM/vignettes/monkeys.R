## ---- label="data", fig.show='hold', fig.height=4, fig.width=7, warning=FALSE, message=FALSE----
library(PhylogeneticEM)
data(monkeys)

plot(params_BM(p = 2),
     data = monkeys$dat, phylo = monkeys$phy,
     show.tip.label = TRUE, cex = 0.5, no.margin = TRUE)

## ---- label="Fit_EM", warning=FALSE, message=FALSE-----------------------
res <- PhyloEM(phylo = monkeys$phy,
               Y_data = monkeys$dat,
               process = "scOU",                   ## scalar OU model
               random.root = TRUE,                 ## Root is stationary
               stationary.root = TRUE,
               nbr_alpha = 4,                      ## Number of alpha values tested (should be raised)
               K_max = 10,                         ## Maximal number of shifts
               parallel_alpha = TRUE,              ## This can be set to TRUE for
               Ncores = 2)                         ## parallel computations
res

## ---- fig.show='hold', fig.height=4, fig.width=7, warning=FALSE----------
plot(res)

## ---- fig.show='hold', fig.height=4, fig.width=4, warning=FALSE----------
plot_criterion(res)

## ---- fig.show='hold', fig.height=4, fig.width=7, warning=FALSE----------
plot(res, params = params_process(res, K = 5))

## ---- echo=FALSE---------------------------------------------------------
params_5 <- params_process(res, K = 5)

## ---- fig.show='hold', fig.height=4, fig.width=8, warning=FALSE----------
plot(equivalent_shifts(monkeys$phy, params_process(res, K = 5)),
     show_shifts_values = FALSE, shifts_cex = 0.5)

## ---- label="Fit_EM_rot", warning=FALSE, message=FALSE-------------------
# An arbitrary rotation
theta <- pi/4
rot <- matrix(c(cos(theta), -sin(theta), sin(theta), cos(theta)),
              nrow = 2, ncol = 2)

# Rotate data
Yrot <- t(rot) %*% monkeys$dat
rownames(Yrot) <- rownames(monkeys$dat)

# PhyloEM on rotated data
res_rot <- PhyloEM(phylo = monkeys$phy,
                   Y_data = Yrot,                      ## rotated data
                   process = "scOU",                   
                   random.root = TRUE,                 
                   stationary.root = TRUE,
                   nbr_alpha = 4,
                   K_max = 10,                         
                   parallel_alpha = TRUE,              
                   Ncores = 2)                         

## ---- fig.show='hold', fig.height=4, fig.width=7, warning=FALSE----------
plot(res_rot)

## ---- fig.show='hold', fig.height=3, fig.width=3, warning=FALSE----------
plot(res, params = params_process(res, K = 3), no.margin = TRUE)
plot(res_rot, params = params_process(res, K = 3), no.margin = TRUE)

## ---- fig.show='hold', fig.height=4, fig.width=4, warning=FALSE----------
plot_criterion(res, "log_likelihood")
plot_criterion(res_rot, "log_likelihood", pch = "+", add = TRUE)

## ---- fig.show='hold', fig.height=4, fig.width=4, warning=FALSE----------
plot_criterion(res)
plot_criterion(res_rot, pch = "+", add = TRUE)

## ---- label="merge", warning=FALSE---------------------------------------
res_merge <- merge_rotations(res, res_rot)

## ---- fig.show='hold', fig.height=4, fig.width=4, warning=FALSE----------
plot_criterion(res_merge)

## ---- label="Fit_EM_rot2", warning=FALSE, message = FALSE----------------
# An other rotation
theta <- pi/3
rot2 <- matrix(c(cos(theta), -sin(theta), sin(theta), cos(theta)),
              nrow = 2, ncol = 2)

# Rotate data
Yrot2 <- t(rot2) %*% monkeys$dat
rownames(Yrot2) <- rownames(monkeys$dat)

# PhyloEM on rotated data
res_rot2 <- PhyloEM(phylo = monkeys$phy,
                   Y_data = Yrot2,
                   process = "scOU",                   
                   random.root = TRUE,                 
                   stationary.root = TRUE,
                   nbr_alpha = 2,           ## Note that this can also be different
                   K_max = 10,                        
                   parallel_alpha = TRUE,            
                   Ncores = 2)                        

# Merge
res_merge2 <- merge_rotations(res, res_rot, res_rot2)

## ---- fig.show='hold', fig.height=4, fig.width=4, warning=FALSE----------
plot_criterion(res_merge2)

## ---- label="Fit_EM_negative", warning=FALSE, message = FALSE------------
res_neg <- PhyloEM(phylo = monkeys$phy,
                   Y_data = monkeys$dat,
                   process = "scOU",
                   random.root = FALSE,      ## root needs to be fixed
                   K_max = 10,
                   parallel_alpha = TRUE,
                   Ncores = 2,
                   nbr_alpha = 4,            ## 2 negative, 2 positive (should be more)
                   allow_negative = TRUE)    ## allow negative alpha in the grid

## ------------------------------------------------------------------------
params_process(res_neg, K = 0)

## ---- fig.show='hold', fig.height=4, fig.width=4, warning=FALSE----------
plot_criterion(res_neg, "BGHmlraw")

