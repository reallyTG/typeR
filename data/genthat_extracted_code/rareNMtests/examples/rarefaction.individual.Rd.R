library(rareNMtests)


### Name: rarefaction.individual
### Title: Rarefied species richness with Hill numbers
### Aliases: rarefaction.individual rarefaction.sample
### Keywords: diversity

### ** Examples

  ## Not run: 
##D    ## Individual-based and coverage-based rarefaction
##D    # Simulate a community with number of species (sr) and evenness randomly selected
##D    spn <- rlnorm(runif(1, 10, 200))
##D    evenness <- runif(1, log(1.1), log(33))
##D    com <- round(rlnorm(spn, 3, evenness))
##D    # Sample the community (with sample size n = 500 individuals)
##D    sample1 <- sample(paste("sp",1:length(com)), 500, replace=TRUE, prob=com)
##D    sample1 <- table(sample1)
##D 
##D    # Get the individual-based and coverage-based rarefaction curves for different Hill numbers
##D    ibr.q0 <- rarefaction.individual(sample1)
##D    ibr.q1 <- rarefaction.individual(sample1, q=1)
##D    ibr.q2 <- rarefaction.individual(sample1, q=2)
##D    ibr.q0.cov <- rarefaction.individual(sample1, method="coverage")
##D    ibr.q1.cov <- rarefaction.individual(sample1, q=1, method="coverage")
##D    ibr.q2.cov <- rarefaction.individual(sample1, q=2, method="coverage")
##D 
##D    # Plot the results
##D    par(mfcol=c(1,2))
##D    plot(ibr.q0[,1], ibr.q0[,2], lwd=2, xlab="Number of individuals", ylab="Hill numbers",
##D    type="l", main="Individual-based rarefaction")
##D    lines(ibr.q1[,1], ibr.q1[,2], lwd=2, lty=2)
##D    lines(ibr.q2[,1], ibr.q2[,2], lwd=2, lty=3)
##D    legend("bottomright", lty=c(1,2,3), lwd=2, legend=c("q = 0", "q = 1", "q = 2"), cex=1.2)
##D    plot(ibr.q0.cov[,1], ibr.q0.cov[,2], lwd=2, xlab="Coverage", ylab="Hill numbers",
##D    type="l", main="Coverage-based rarefaction")
##D    lines(ibr.q1.cov[,1], ibr.q1.cov[,2], lwd=2, lty=2)
##D    lines(ibr.q2.cov[,1], ibr.q2.cov[,2], lwd=2, lty=3)
##D    legend("topleft", lty=c(1,2,3), lwd=2, legend=c("q = 0", "q = 1", "q = 2"), cex=1.2)
##D 
##D    ## Sample-based and coverage-based rarefaction
##D    # Load the data
##D    data(Chiapas)
##D    Chiapas <- subset(Chiapas, Region=="El Triunfo")
##D    str(Chiapas)
##D 
##D    # Get sample-based and coverage-based rarefaction curves for different Hill numbers
##D    sbr.q0 <- rarefaction.sample(Chiapas[,-1])
##D    sbr.q1 <- rarefaction.sample(Chiapas[,-1], q=1)
##D    sbr.q2 <- rarefaction.sample(Chiapas[,-1], q=2)
##D    sbr.q0.cov <- rarefaction.sample(Chiapas[,-1], method="coverage")
##D    sbr.q1.cov <- rarefaction.sample(Chiapas[,-1], q=1, method="coverage")
##D    sbr.q2.cov <- rarefaction.sample(Chiapas[,-1], q=2, method="coverage")
##D 
##D    # Plot the results
##D    par(mfcol=c(1,2))
##D    plot(sbr.q0[,1], sbr.q0[,2], lwd=2, xlab="Sampling units", ylab="Hill numbers",
##D    type="l", main="Sample-based rarefaction")
##D    lines(sbr.q1[,1], sbr.q1[,2], lwd=2, lty=2)
##D    lines(sbr.q2[,1], sbr.q2[,2], lwd=2, lty=3)
##D    legend("bottomright", lty=c(1,2,3), lwd=2, legend=c("q = 0", "q = 1", "q = 2"), cex=1.2)
##D    plot(sbr.q0.cov[,1], sbr.q0.cov[,2], lwd=2, xlab="Coverage", ylab="Hill numbers",
##D    type="l", main="Coverage-based rarefaction")
##D    lines(sbr.q1.cov[,1], sbr.q1.cov[,2], lwd=2, lty=2)
##D    lines(sbr.q2.cov[,1], sbr.q2.cov[,2], lwd=2, lty=3)
##D    legend("topleft", lty=c(1,2,3), lwd=2, legend=c("q = 0", "q = 1", "q = 2"), cex=1.2)
##D   
## End(Not run)



