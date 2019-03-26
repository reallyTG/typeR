## ----load_packages-------------------------------------------------------
library(ashr)
library(ggplot2)

## ----initialize, collapse=TRUE-------------------------------------------
set.seed(100)

# Simulates data sets for experiments below.
rnormmix_datamaker = function (args) {
  
  # generate the proportion of true nulls randomly.
  pi0 = runif(1,args$min_pi0,args$max_pi0) 
  k   = ncomp(args$g)
  
  #randomly draw a component
  comp   = sample(1:k,args$nsamp,mixprop(args$g),replace = TRUE) 
  isnull = (runif(args$nsamp,0,1) < pi0)
  beta   = ifelse(isnull,0,rnorm(args$nsamp,comp_mean(args$g)[comp],
                                 comp_sd(args$g)[comp]))
  sebetahat = args$betahatsd
  betahat   = beta + rnorm(args$nsamp,0,sebetahat)
  meta      = list(g1 = args$g,beta = beta,pi0 = pi0)
  input     = list(betahat = betahat,sebetahat = sebetahat,df = NULL)
  return(list(meta = meta,input = input))
}

NSAMP = 1000
s     = 1/rgamma(NSAMP,5,5)

sim.spiky =
  rnormmix_datamaker(args = list(g = normalmix(c(0.4,0.2,0.2,0.2),
                                               c(0,0,0,0),
                                               c(0.25,0.5,1,2)),
                                  min_pi0   = 0,
                                  max_pi0   = 0,
                                  nsamp     = NSAMP,
                                  betahatsd = s))

sim.bignormal =
  rnormmix_datamaker(args = list(g         = normalmix(1,0,4),
                                 min_pi0   = 0,
                                 max_pi0   = 0,
                                 nsamp     = NSAMP,
                                 betahatsd = s))

cat("Summary of observed beta-hats:\n")
print(rbind(spiky     = quantile(sim.spiky$input$betahat,seq(0,1,0.1)),
            bignormal = quantile(sim.bignormal$input$betahat,seq(0,1,0.1))),
      digits = 3)

## ----run_ash-------------------------------------------------------------
beta.spiky.ash     = ash(sim.spiky$input$betahat,s)
beta.bignormal.ash = ash(sim.bignormal$input$betahat,s)

## ----plot_shrunk_vs_obs, fig.align="center"------------------------------
make_df_for_ashplot =
  function (sim1, sim2, ash1, ash2, name1 = "spiky", name2 = "big-normal") {
    n = length(sim1$input$betahat)
    x = c(get_lfsr(ash1),get_lfsr(ash2))
    return(data.frame(betahat  = c(sim1$input$betahat,sim2$input$betahat),
                      beta_est = c(get_pm(ash1),get_pm(ash2)),
                      lfsr     = x,
                      s        = c(sim1$input$sebetahat,sim2$input$sebetahat),
                      scenario = c(rep(name1,n),rep(name2,n)),
                      signif   = x < 0.05))
  }

ashplot = function(df,xlab="Observed beta-hat",ylab="Shrunken beta estimate")
  ggplot(df,aes(x = betahat,y = beta_est,color = 1/s)) +
    xlab(xlab) + ylab(ylab) + geom_point() +
    facet_grid(.~scenario) +
    geom_abline(intercept = 0,slope = 1,linetype = "dotted") +
    scale_colour_gradient2(midpoint = median(1/s),low = "blue",
                           mid = "white",high = "red",space = "Lab") +
    coord_fixed(ratio = 1)

df = make_df_for_ashplot(sim.spiky,sim.bignormal,beta.spiky.ash,
                         beta.bignormal.ash)
print(ashplot(df))

## ----plot_pvalues, fig.align="center", warning=FALSE---------------------
pval_plot = function (df)
  ggplot(df,aes(x = pnorm(-abs(betahat/s)),y = lfsr,color = log(s))) +
  geom_point() + facet_grid(.~scenario) + xlim(c(0,0.025)) +
  xlab("p value") + ylab("lfsr") +
  scale_colour_gradient2(midpoint = 0,low = "red",
                         mid = "white",high = "blue")

print(pval_plot(df))

## ----run_ash_ET, fig.align="center", warning=FALSE-----------------------
beta.bignormal.ash.ET =
  ash(sim.bignormal$input$betahat,s,alpha = 1,mixcompdist = "normal")
beta.spiky.ash.ET =
  ash(sim.spiky$input$betahat,s,alpha = 1,mixcompdist = "normal")
df.ET = make_df_for_ashplot(sim.spiky,sim.bignormal,beta.spiky.ash.ET,
                            beta.bignormal.ash.ET)
ashplot(df.ET,ylab = "Shrunken beta estimate (ET model)")
pval_plot(df.ET)

## ----volcano, fig.align="center", warning=FALSE--------------------------
print(ggplot(df,aes(x = betahat,y = -log10(2*pnorm(-abs(betahat/s))),
                    col = signif)) +
  geom_point(alpha = 1,size = 1.75) + facet_grid(.~scenario) +
  theme(legend.position = "none") + xlim(c(-10,10)) + ylim(c(0,15)) +
  xlab("Effect (beta)") + ylab("-log10 p-value"))

## ----info----------------------------------------------------------------
print(sessionInfo())

