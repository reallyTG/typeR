library(unmarked)


### Name: parboot
### Title: Parametric bootstrap method for fitted models inheriting class.
### Aliases: parboot plot,parboot,missing-method show,parboot-method

### ** Examples


data(linetran)
(dbreaksLine <- c(0, 5, 10, 15, 20))
lengths <- linetran$Length

ltUMF <- with(linetran, {
	unmarkedFrameDS(y = cbind(dc1, dc2, dc3, dc4),
	siteCovs = data.frame(Length, area, habitat), dist.breaks = dbreaksLine,
	tlength = lengths*1000, survey = "line", unitsIn = "m")
    })

# Fit a model
(fm <- distsamp(~area ~habitat, ltUMF))

# Function returning three fit-statistics.
fitstats <- function(fm) {
    observed <- getY(fm@data)
    expected <- fitted(fm)
    resids <- residuals(fm)
    sse <- sum(resids^2)
    chisq <- sum((observed - expected)^2 / expected)
    freeTuke <- sum((sqrt(observed) - sqrt(expected))^2)
    out <- c(SSE=sse, Chisq=chisq, freemanTukey=freeTuke)
    return(out)
    }

(pb <- parboot(fm, fitstats, nsim=25, report=1))
plot(pb, main="")


# Finite-sample inference for a derived parameter.
# Population size in sampled area

Nhat <- function(fm) {
    sum(bup(ranef(fm, K=50)))
    }

set.seed(345)
(pb.N <- parboot(fm, Nhat, nsim=25, report=5))

# Compare to empirical Bayes confidence intervals
colSums(confint(ranef(fm, K=50)))






