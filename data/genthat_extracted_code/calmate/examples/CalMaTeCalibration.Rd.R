library(calmate)


### Name: CalMaTeCalibration
### Title: The CalMaTeCalibration class
### Aliases: CalMaTeCalibration
### Keywords: classes

### ** Examples
## Not run: 
##D   
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # CRMAv2 - Preprocess raw Affymetrix data
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D library("aroma.affymetrix");  # Needed for CRMAv2
##D dataSet <- "Affymetrix_2006-TumorNormal";
##D chipType <- "Mapping250K_Nsp";
##D dsList <- doCRMAv2(dataSet, chipType=chipType, combineAlleles=FALSE,
##D                                              plm="RmaCnPlm", verbose=-10);
##D print(dsList);
##D 
##D 
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # CalMaTe - Post-calibration of ASCNs estimates
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D asn <- CalMaTeCalibration(dsList);
##D print(asn);
##D 
##D # For speed issues, we will here only process loci on Chromosome 17.
##D chr <- 17;
##D ugp <- getAromaUgpFile(dsList$total);
##D units <- getUnitsOnChromosome(ugp, chr);
##D 
##D dsNList <- process(asn, units=units, verbose=verbose);
##D print(dsNList);
##D 
##D 
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # Plot allele B fractions (before and after)
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # Sample #1 and Chromosome 17
##D ii <- 1;
##D 
##D # Extract raw (TCN,BAF)
##D df <- getFile(dsList$total, ii);
##D dfR <- getAverageFile(dsList$total, verbose=verbose);
##D gamma <- extractRawCopyNumbers(df, logBase=NULL, chromosome=chr);
##D gammaR <- extractRawCopyNumbers(dfR, logBase=NULL, chromosome=chr);
##D gamma <- 2*divideBy(gamma, gammaR);
##D df <- getFile(dsList$fracB, ii);
##D beta <- extractRawAlleleBFractions(df, chromosome=chr);
##D 
##D # Extract calibrated (TCN,BAF)
##D dfN <- getFile(dsNList$fracB, ii);
##D betaN <- extractRawAlleleBFractions(dfN, chromosome=chr);
##D dfN <- getFile(dsNList$total, ii);
##D gammaN <- extractRawCopyNumbers(dfN, logBase=NULL, chromosome=chr);
##D 
##D # Plot
##D subplots(4, ncol=2, byrow=FALSE);
##D plot(beta);
##D title(sprintf("%s", getName(beta)));
##D plot(gamma);
##D plot(betaN);
##D title(sprintf("%s (CalMaTe)", getName(betaN)));
##D plot(gammaN);
##D 
##D  
## End(Not run)


