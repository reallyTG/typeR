library(mirt)


### Name: DIF
### Title: Differential item functioning statistics
### Aliases: DIF
### Keywords: DIF

### ** Examples

## Not run: 
##D 
##D #simulate data where group 2 has a smaller slopes and more extreme intercepts
##D set.seed(12345)
##D a1 <- a2 <- matrix(abs(rnorm(15,1,.3)), ncol=1)
##D d1 <- d2 <- matrix(rnorm(15,0,.7),ncol=1)
##D a2[1:2, ] <- a1[1:2, ]/3
##D d1[c(1,3), ] <- d2[c(1,3), ]/4
##D head(data.frame(a.group1 = a1, a.group2 = a2, d.group1 = d1, d.group2 = d2))
##D itemtype <- rep('2PL', nrow(a1))
##D N <- 1000
##D dataset1 <- simdata(a1, d1, N, itemtype)
##D dataset2 <- simdata(a2, d2, N, itemtype, mu = .1, sigma = matrix(1.5))
##D dat <- rbind(dataset1, dataset2)
##D group <- c(rep('D1', N), rep('D2', N))
##D 
##D #### no anchors, all items tested for DIF by adding item constrains one item at a time.
##D # define a parallel cluster (optional) to help speed up internal functions
##D mirtCluster()
##D 
##D # Information matrix with Oakes' identity (not controlling for latent group differences)
##D # NOTE: Without properly equating the groups the following example code is not testing for DIF,
##D      # but instead reflects a combination of DIF + latent-trait distribution effects
##D model <- multipleGroup(dat, 1, group, SE = TRUE)
##D 
##D #test whether adding slopes and intercepts constraints results in DIF. Plot items showing DIF
##D resulta1d <- DIF(model, c('a1', 'd'), plotdif = TRUE)
##D resulta1d
##D 
##D #same as above, but using Wald tests with Benjamini & Hochberg adjustment
##D resulta1dWald <- DIF(model, c('a1', 'd'), Wald = TRUE, p.adjust = 'fdr')
##D resulta1dWald
##D round(resulta1dWald$adj_pvals, 4)
##D 
##D #test whether adding only slope constraints results in DIF for all items
##D resulta1 <- DIF(model, 'a1')
##D resulta1
##D 
##D #following up on resulta1d, to determine whether it's a1 or d parameter causing DIF
##D (a1s <- DIF(model, 'a1', items2test = 1:3))
##D (ds <- DIF(model, 'd', items2test = 1:3))
##D 
##D ####
##D # using items 4 to 15 as anchors to test for DIF after adjusting for latent-trait differences
##D itemnames <- colnames(dat)
##D model_anchor <- multipleGroup(dat, model = 1, group = group,
##D   invariance = c(itemnames[4:15], 'free_means', 'free_var'))
##D anchor <- DIF(model_anchor, c('a1', 'd'), items2test = 1:3)
##D anchor
##D 
##D ### drop down approach (freely estimating parameters across groups) when
##D ### specifying a highly constrained model with estimated latent parameters
##D model_constrained <- multipleGroup(dat, 1, group,
##D   invariance = c(colnames(dat), 'free_means', 'free_var'))
##D dropdown <- DIF(model_constrained, 'd', scheme = 'drop')
##D dropdown
##D 
##D ### sequential searches using SABIC as the selection criteria
##D # starting from completely different models
##D model <- multipleGroup(dat, 1, group)
##D stepup <- DIF(model, c('a1', 'd'), scheme = 'add_sequential')
##D stepup
##D 
##D #step down procedure for highly constrained model
##D model <- multipleGroup(dat, 1, group, invariance = itemnames)
##D stepdown <- DIF(model, c('a1', 'd'), scheme = 'drop_sequential')
##D stepdown
## End(Not run)



