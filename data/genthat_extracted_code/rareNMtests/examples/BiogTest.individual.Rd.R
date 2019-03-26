library(rareNMtests)


### Name: BiogTest.individual
### Title: Biogeographical null model tests
### Aliases: BiogTest.individual BiogTest.sample plot.BiogTest
### Keywords: diversity

### ** Examples

  ## Not run: 
##D    ## Individual-based and coverage-based rarefaction
##D    # Simulate a community with number of species (spn) and evenness randomly selected
##D 
##D    spn <- round(runif(1, 10, 200))
##D    evenness <- runif(1, log(1.1), log(33))
##D    com <- round(rlnorm(spn, 2, evenness))
##D    Ss <- round(runif(1, 50, 500))
##D    sample1 <- sample(paste("sp",1:length(com)), rpois(1, Ss), replace=TRUE, prob=com)
##D    sample1 <- data.frame(table(sample1))
##D    colnames(sample1) <- c("species", "sample1")
##D    sample2 <- sample(paste("sp",1:length(com)), rpois(1, Ss), replace=TRUE, prob=com)
##D    sample2 <- data.frame(table(sample2))
##D    colnames(sample2) <- c("species", "sample2")
##D    df <- merge(sample1, sample2, by="species", all=TRUE)
##D    rownames(df) <- df$species
##D    df[is.na(df)] <- 0
##D    df <- df[,2:3]
##D 
##D    # Biogeographical null model test using sample-based rarefaction curves
##D    # for species richness (q = 0)
##D    # The test should not reject the null hypothesis (p > 0.05)
##D    ibbiogq0 <- BiogTest.individual(df, MARGIN=2, powerfun=0.8, log.scale=TRUE)
##D    plot(ibbiogq0)
##D 
##D    # Biogeographical null model test using coverage-based rarefaction curves
##D    # for the exponential Shannon index (q = 1)
##D    ibbiogq1cov <- BiogTest.individual(df, MARGIN=2, method="coverage", q=1, 
##D    powerfun=0.8, log.scale=TRUE)
##D    plot(ibbiogq1cov)
##D 
##D    ## Sample-based and coverage-based rarefaction
##D    # Load the data
##D    data(Chiapas)
##D    Chiapas <- subset(Chiapas, Region!="El Triunfo")
##D    str(Chiapas)
##D 
##D    # Biogeographical null model test using sample-based rarefaction curves
##D    # for species richness (q = 0)
##D    sbbiogq0 <- BiogTest.sample(Chiapas[,-1], by=Chiapas[,1], MARGIN=1)
##D    plot(sbbiogq0)
##D 
##D    # Biogeographical null model test using coverage-based rarefaction curves
##D    # for the inverse Simpson index (q = 2)
##D    sbbioq2cov <- EcoTest.sample(Chiapas[,-1], by=Chiapas[,1], MARGIN=1, 
##D    method="coverage", q=2)
##D    plot(sbbioq2cov)
##D   
## End(Not run)



