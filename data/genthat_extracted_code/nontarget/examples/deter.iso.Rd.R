library(nontarget)


### Name: deter.iso
### Title: Generating list of type iso from filtered m/z differences.
### Aliases: deter.iso

### ** Examples

## No test: 
data(peaklist)
diffs<-plotdiff(peaklist, histbreaks = 10000, rttol = c(0, 0), mztol = c(0.3, 100), plotit = TRUE);
iso<-deter.iso(diffs,histbreaks=10000,mzmin=0,mzmax=40,cutcount=500,plotit=TRUE);
pattern<-pattern.search(
  peaklist,
  iso,
  cutint=10000,
  rttol=c(-0.05,0.05),
  mztol=0.005,
  mzfrac=0.1,
  ppm=FALSE,
  inttol=0.2,
  #rules=c(FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE),
  rules=c(TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE),
  deter=TRUE,
  entry=50
);
## End(No test)



