library(nontarget)


### Name: homol.search
### Title: Homologue series extraction from LC-MS data.
### Aliases: homol.search

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
	minrt=-.5,
	maxrt=2,
	ppm=TRUE,
	mztol=3.5,
	rttol=0.5,
	minlength=5,
	mzfilter=FALSE,
	vec_size=3E6,
	mat_size=3,
	spar=.45,
	R2=.98,
	plotit=FALSE
)	
plothomol(homol);
## End(No test)



