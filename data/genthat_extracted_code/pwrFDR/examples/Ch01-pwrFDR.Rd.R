library(pwrFDR)


### Name: pwrFDR
### Title: Power in the BH-FDR procedure.
### Aliases: pwrFDR
### Keywords: FDR Benjamini Hochberg microarrays Multiple.Testing
###   average.power k.power lambda.power

### ** Examples

## Example 1a: average power
   rslt.avgp <- pwrFDR(effect.size=0.79, n.sample=46, r.1=2000/54675, FDR=0.15)
   rslt.avgp

## Example 1b: lambda-power
   rslt.lpwr <- pwrFDR(effect.size=0.79, n.sample=46, r.1=2000/54675,
                       FDR=0.15, lambda=0.80, N.tests=54675)
   rslt.lpwr

## Example 1c: sample size required for given average power
   rslt.ss.avgp <- pwrFDR(effect.size=0.79, average.power=0.82,
                          r.1=2000/54675, FDR=0.15)
   rslt.ss.avgp

## Example 1d: sample size required for given lambda-power
   rslt.ss.lpwr <- pwrFDR(effect.size=0.79, L.power=0.82, lambda=0.80,
                          r.1=2000/54675, FDR=0.15, N.tests=54675)
   rslt.ss.lpwr

## Example 1e: simulation
   rslt.sim <- update(rslt.avgp, method="sim", n.sim=500, N.tests=1000)
   rslt.sim

## Example 2: methods for adding, subtracting, multiplying, dividing, exp, log,
## logit and inverse logit
   rslt.avgp - rslt.sim
   logit(rslt.avgp)       ## etc
   
## Example 3: Compare the asymptotic distribution of S/M with kernel
##            density estimate from simulated data 
   pdf <- with(detail(rslt.sim)$reps, density(S/M1))

   med <- with(detail(rslt.sim)$reps, median(S/M1))
   avg <- rslt.sim$average.power
   sd <- rslt.sim$v.SoM.emp^0.5

   rng.x <- range(pdf$x)
   rng.y <- range(c(pdf$y, dnorm(pdf$x, mean=avg, sd=sd)))

   plot(rng.x, rng.y, xlab="u", ylab="PDF for S/M", type="n")
   with(pdf, lines(x, y))
   lines(rep(rslt.sim$average.power, 2), rng.y, lty=2)
   lines(pdf$x, dnorm(pdf$x, mean=avg, sd=sd), lty=3)



