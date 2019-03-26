library(discrimARTs)


### Name: mix.synthetic
### Title: Generate synthetic mixtures for testing of 'mix.mle'.
### Aliases: mix.synthetic mix.synthetic.normal mix.synthetic.facing.gamma

### ** Examples

## Normal: draw samples
normalmix.draws <- mix.synthetic.normal(mix.prob=0.1,
    mu1=10, sd1=2, mu2=20, sd2=2)
## Estimated initial conditions may fail for mix.prob far from 0.5
normalmix.fit <- mix.mle(normalmix.draws)
plot(normalmix.fit)

## Facing gamma: draw samples
gammamix.params <- list(lower = 0.37, upper=4.72, mix.prob=0.55,
    dist1.par1=1.50, dist1.par2=.4, dist2.par1=3.2, dist2.par2=.5)
    ## simulate synthetic data
gammamix.draws <- with(gammamix.params, 
    mix.synthetic.facing.gamma( lower=lower, upper=upper,  mix.prob=mix.prob,
        shape1=dist1.par1, scale1=dist1.par2, 
        shape2=dist2.par1, scale2=dist2.par2
        )
)
## Fit and return
## Use parameters as initial values 
gammamix.fit <- with(gammamix.params,
    mix.mle(gammamix.draws,  method='facing.gamma', 
          lower=lower, upper=upper, mix.prob=mix.prob,
          dist1.par1=dist1.par1, dist1.par2=dist1.par2, 
          dist2.par1=dist2.par1, dist2.par2=dist2.par2
    )
)
plot(gammamix.fit)




