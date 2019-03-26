library(algstat)


### Name: spectral
### Title: Analyze a Rank Dataset
### Aliases: spectral

### ** Examples

## Not run: 
##D 
##D 
##D 
##D ## voting statistics at different levels
##D ############################################################
##D 
##D # load the cookies dataset:
##D data(cookie)
##D cookie$freq
##D cookie$cookies
##D 
##D 
##D # performing the spectral analysis
##D (out <- spectral(cookie$freq, 6, 3, cookie$cookies))
##D 
##D 
##D out$obs # the original observations, and the summary statistics
##D 
##D out$exp # each level is conditional on the previous level's statistics
##D         # (e.g. what you would expect for 1st order effects given sample size)
##D         # these are generated using 10k markov bases based mcmc samples
##D 
##D out$p.value # these are approximate exact test p-values using various
##D             # popular test statistics.  the approximations are good to
##D             # monte carlo error
##D 
##D out$p.value.se # these are the standard errors using the sqrt(p*(1-p)/n)
##D                # asymptotic formula, known to have poor performance
##D                # for small/large p; see package binom for better
##D 
##D out$statistic # the individual statistics are also available
##D               # the values are not comprable across Vi levels (the rows)
##D               # as they have asymptotic chi-squared distributions with
##D               # different degrees of freedom
##D 
##D out$fullExp # you can also get the expected number of samples at each scale
##D             # for tables with the same ith order statistics, i = 0, ..., k-1
##D 
##D 
##D # these can be seen to (re)construct an expected picture of the
##D # complete data given each successive collection of statistics
##D cbind(
##D   obs = cookie$freq,
##D   as.data.frame(lapply(out$fullExp, function(x) round(x[[4]],1)))
##D )[c(2:4,1)]
##D # notice that the reconstruction given only the first order statistics
##D # (the number of individual cookies selected) is quite good
##D 
##D 
##D 
##D # instead of using the reconstructions from the exp coming from
##D # the samples, you could reconstruct the summaries of the observed
##D # data using bump; it's not quite as good :
##D V0 <- bump(cookie$freq, 6, 3, 3, 0)
##D V1 <- bump(cookie$freq, 6, 3, 3, 1)
##D V2 <- bump(cookie$freq, 6, 3, 3, 2)
##D 
##D cbind(
##D   obs = cookie$freq,
##D   round(data.frame(
##D     V0 = bump(V0, 6, 3, 0, 3),
##D     V1 = bump(V1, 6, 3, 1, 3),
##D     V2 = bump(V2, 6, 3, 2, 3)
##D   ), 2)
##D )[c(2:4,1)]
##D 
##D 
##D 
##D 
##D # you can see the model step-by-step with showStages() :
##D out$showStages()
##D # notice (1) the significant reduction in the residuals after conditioning
##D # on the first order statistics and also (2) the powdery noise after
##D # conditioning on the second order statistics.
##D # the p-values reflect the same:
##D #   * the residuals from conditioning on the sample size show the first
##D #     order effects are strongly significant (in out$p.value V1 = 0)
##D #   * the residuals from conditioning on the first order effects suggest
##D #     the second order effects might be significant (V2 ~ .04-.13ish)
##D #   * the residuals from conditioning on the second order effects indicate
##D #     the third order effects are entirely insignificant (V3 > .2)
##D 
##D 
##D # the isotypic subpaces can be used to determine the pure order effects :
##D 
##D out$isotypicBases # bases of the isotypic subspaces (here 4)
##D 
##D out$effects # pure ith order effects; cookie$freq projected onto the bases
##D             # these are their effects at the data level, so they all have
##D             # the same length as the original dataset: choose(n, k)
##D 
##D zapsmall(rowSums(out$effects)) # the effects sum to the data
##D 
##D 
##D # if the Vk effects are 0, then the conclusion is that Vk is perfectly
##D # predicted with the (k-1)st level statistics.  this may lead to the
##D # conclusion that the l2 norms (say) of the effects might be used to
##D # gauge the relative strength of effects :
##D out$effectsNorms # = apply(out$effects, 2, lpnorm)
##D 
##D 
##D # the natural (not full-dimensional) residuals can be seen with the summary
##D out
##D # or with
##D out$residuals
##D # these are the residuals (obs ith level stats) - (exp ith level stats)
##D # given the (i-1)st statistics
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D # bump is a useful function :
##D out$obs
##D bump(cookie$freq, 6, 3, 3, 0) # the 0 level is the number of voters, not votes
##D bump(cookie$freq, 6, 3, 3, 1)
##D bump(cookie$freq, 6, 3, 3, 2)
##D bump(cookie$freq, 6, 3, 3, 3)
##D 
##D V1 <- out$obs$V1 # = bump(cookie$freq, 6, 3, 3, 1)
##D bump(V1, 6, 3, 1, 0)
##D bump(V1, 6, 3, 1, 1)
##D bump(V1, 6, 3, 1, 2) # cbind(bump(V1, 6, 3, 1, 2), out$exp$V2)
##D bump(V1, 6, 3, 1, 3) # cbind(bump(V1, 6, 3, 1, 3), out$fullExp$V1[[4]])
##D # the differences here are between an observation and an expectation
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D out$obs$V1 - out$exp$V1
##D out$residuals$V1
##D out$decompose(out$effects$V1)$V1
##D 
##D out$obs$V2 - out$exp$V2
##D out$residuals$V2
##D 
##D   out$decompose(out$effects$V0)$V2 +
##D   out$decompose(out$effects$V1)$V2 +
##D   out$decompose(out$effects$V2)$V2 -
##D   out$exp$V2
##D 
##D 
##D 
##D 
##D 
##D # this is how to reconstruct the observation given the effects
##D # the cols of out$effects are the Vk order effects reconstructed
##D # from the lower level effects
##D out$obs$V0
##D zapsmall(
##D   out$decompose(out$effects$V0)$V0
##D )
##D 
##D out$obs$V1
##D zapsmall(
##D   out$decompose(out$effects$V0)$V1 +
##D   out$decompose(out$effects$V1)$V1
##D )
##D 
##D out$obs$V2
##D zapsmall(
##D   out$decompose(out$effects$V0)$V2 +
##D   out$decompose(out$effects$V1)$V2 +
##D   out$decompose(out$effects$V2)$V2
##D )
##D 
##D out$obs$V3
##D zapsmall(
##D   out$decompose(out$effects$V0)$V3 +
##D   out$decompose(out$effects$V1)$V3 +
##D   out$decompose(out$effects$V2)$V3 +
##D   out$decompose(out$effects$V3)$V3
##D )
##D zapsmall(rowSums(out$effects))
##D 
##D all(cookie$freq == zapsmall(rowSums(out$effects)))
##D 
##D 
##D 
##D out$effects$V0
##D out$effects$V0 + out$effects$V1
##D out$effects$V0 + out$effects$V2
##D out$effects$V0 + out$effects$V3
##D 
##D 
##D 
##D str(out$sampsDecomposed)
##D as.data.frame(lapply(out$sampsDecomposed, function(l) rowMeans(l$V3)))
##D 
##D eff0 <- rowMeans(out$sampsDecomposed$V0$V3)
##D cbind(eff0, out$effects$V0)
##D 
##D eff1 <- rowMeans(out$sampsDecomposed$V1$V3 - eff0)
##D cbind(eff1, out$effects$V1)
##D 
##D eff2 <- rowMeans(out$sampsDecomposed$V2$V3 - eff0 - eff1)
##D cbind(eff2, out$effects$V2)
##D 
##D sum(eff0)
##D sum(eff1)
##D sum(eff2)
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D str(out$sampsEffectsNorms)
##D 
##D data <- out$sampsEffectsNorms$V0$V3
##D plot(density(data))
##D curve(dnorm(x, mean(data), sd(data)), col = "red", add = TRUE)
##D 
##D data <- out$sampsEffectsNorms$V0$V2
##D plot(density(data))
##D curve(dnorm(x, mean(data), sd(data)), col = "red", add = TRUE)
##D 
##D data <- out$sampsEffectsNorms$V0$V1
##D plot(density(data))
##D curve(dnorm(x, mean(data), sd(data)), col = "red", add = TRUE)
##D 
##D 
##D data <- out$sampsEffectsNorms$V1$V3
##D plot(density(data))
##D curve(dnorm(x, mean(data), sd(data)), col = "red", add = TRUE)
##D 
##D data <- out$sampsEffectsNorms$V1$V2
##D plot(density(data))
##D curve(dnorm(x, mean(data), sd(data)), col = "red", add = TRUE)
##D 
##D 
##D data <- out$sampsEffectsNorms$V2$V3
##D plot(density(data))
##D curve(dnorm(x, mean(data), sd(data)), col = "red", add = TRUE)
##D 
##D 
##D 
##D 
##D 
##D 
##D ## how to convert data into the right format
##D ############################################################
##D # this essentially just uses some clever indexing tricks
##D # to reorder the data in the way you want
##D 
##D data <- cookie$raw       # an example raw, unordered dataset
##D levels <- cookie$cookies # the order of the objects you want
##D levsNndcs <- 1:length(levels)
##D names(levsNndcs) <- levels
##D 
##D 
##D # arrange selections within rows (order of selection doesn't matter)
##D data <- t(apply(data, 1, function(x) x[order(levsNndcs[x])] ))
##D 
##D 
##D # arrange rows (order of selectors doesn't matter)
##D for(k in ncol(data):1) data <- data[order(levsNndcs[data[,k]]),]
##D 
##D 
##D # check that you've done the right thing
##D all( data == cookie$sorted )
##D 
##D # the data frequency order should match that of subsets:
##D subsets(levels, 1)
##D 
##D subsets(levels, 2)
##D sapply(subsets(levels, 2), paste, collapse = ", ")
##D 
##D subsets(levels, 3)
##D sapply(subsets(levels, 3), paste, collapse = ", ")
##D 
##D names(cookie$freq)
##D names(cookie$freq) == sapply(subsets(levels, 3), paste, collapse = ", ")
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D ## other examples
##D ############################################################
##D 
##D # rvotes provides uniform samples
##D 
##D n <- 4
##D k <- 2
##D 
##D raw <- rvotes(250, n, k)
##D rawTogether <- apply(raw, 1, paste, collapse = " ")
##D levels <- sapply(subsets(n, k), paste, collapse = " ")
##D freq <- table( factor(rawTogether, levels = levels) )
##D (out <- spectral(freq, n, k))
##D 
##D out$p.value
##D out$showStages()
##D 
##D out$obs
##D out$exp
##D 
##D 
##D 
##D 
##D 
##D n <- 6
##D k <- 3
##D raw <- rvotes(250, n, k)
##D rawTogether <- apply(raw, 1, paste, collapse = " ")
##D levels <- sapply(subsets(n, k), paste, collapse = " ")
##D freq <- table( factor(rawTogether, levels = levels) )
##D (out <- spectral(freq, n, k))
##D 
##D 
##D n <- 7
##D k <- 3
##D raw <- rvotes(250, n, k)
##D rawTogether <- apply(raw, 1, paste, collapse = " ")
##D levels <- sapply(subsets(n, k), paste, collapse = " ")
##D freq <- table( factor(rawTogether, levels = levels) )
##D (out <- spectral(freq, n, k))
##D 
##D 
##D 
##D n <- 8
##D k <- 3
##D raw <- rvotes(250, n, k)
##D rawTogether <- apply(raw, 1, paste, collapse = " ")
##D levels <- sapply(subsets(n, k), paste, collapse = " ")
##D freq <- table( factor(rawTogether, levels = levels) )
##D # out <- spectral(freq, n, k) # breaks
##D 
##D 
##D 
##D 
## End(Not run)



