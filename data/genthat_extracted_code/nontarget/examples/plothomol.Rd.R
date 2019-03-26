library(nontarget)


### Name: plothomol
### Title: Marks homologue series peaks in a scatterplot of retention time
###   (RT) vs. m/z
### Aliases: plothomol

### ** Examples

## No test: 
data(peaklist);
data(isotopes)
homol<-homol.search(
	peaklist,
	isotopes,	
	elements=c("C","H","O"),
	use_C=TRUE,
	minmz=5,
	maxmz=120,
	minrt=2,
	maxrt=2,
	ppm=TRUE,
	mztol=3.5,
    rttol=0.5,
	minlength=5,
	mzfilter=FALSE,
	vec_size=3E6,
	spar=.45,
	R2=.98,
	plotit=FALSE
)
plothomol(homol,xlim=FALSE,ylim=FALSE,plotlegend=FALSE,plotdefect=FALSE);
## End(No test)



