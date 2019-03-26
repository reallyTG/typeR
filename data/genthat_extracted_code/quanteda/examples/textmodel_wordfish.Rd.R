library(quanteda)


### Name: textmodel_wordfish
### Title: Wordfish text model
### Aliases: textmodel_wordfish

### ** Examples

(wf <- textmodel_wordfish(data_dfm_lbgexample, dir = c(1,5)))
summary(wf, n = 10)
coef(wf)
predict(wf)
predict(wf, se.fit = TRUE)
predict(wf, interval = "confidence")

## Not run: 
##D ie2010dwf <- dfm(data_corpus_irishbudget2010, verbose = FALSE)
##D (wf1 <- textmodel_wordfish(ie2010dfm, dir = c(6,5)))
##D (wf2a <- textmodel_wordfish(ie2010dfm, dir = c(6,5), 
##D                              dispersion = "quasipoisson", dispersion_floor = 0))
##D (wf2b <- textmodel_wordfish(ie2010dfm, dir = c(6,5), 
##D                              dispersion = "quasipoisson", dispersion_floor = .5))
##D plot(wf2a$phi, wf2b$phi, xlab = "Min underdispersion = 0", ylab = "Min underdispersion = .5",
##D      xlim = c(0, 1.0), ylim = c(0, 1.0))
##D plot(wf2a$phi, wf2b$phi, xlab = "Min underdispersion = 0", ylab = "Min underdispersion = .5",
##D      xlim = c(0, 1.0), ylim = c(0, 1.0), type = "n")
##D underdispersedTerms <- sample(which(wf2a$phi < 1.0), 5)
##D which(featnames(ie2010dfm) %in% names(topfeatures(ie2010dfm, 20)))
##D text(wf2a$phi, wf2b$phi, wf2a$features, 
##D      cex = .8, xlim = c(0, 1.0), ylim = c(0, 1.0), col = "grey90")
##D text(wf2a$phi['underdispersedTerms'], wf2b$phi['underdispersedTerms'], 
##D      wf2a$features['underdispersedTerms'], 
##D      cex = .8, xlim = c(0, 1.0), ylim = c(0, 1.0), col = "black")
##D if (require(austin)) {
##D     wf_austin <- austin::wordfish(quanteda::as.wfm(ie2010dfm), dir = c(6,5))
##D     cor(wf1$theta, wf_austin$theta)
##D }
## End(Not run)



