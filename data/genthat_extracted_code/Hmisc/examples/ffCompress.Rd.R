library(Hmisc)


### Name: ffCompress
### Title: Transform Data Frame Into a Compact 'ff' Object
### Aliases: ffCompress as.data.frame.ffdflabel [.ffdflabel
### Keywords: attribute misc utilities

### ** Examples

## Not run: 
##D require(ff)
##D require(survival)
##D n <- 1e6
##D d <- data.frame(x=rnorm(n), y=sample(0:1, n, TRUE),
##D                 i=as.Date('2013-01-02'), S=Surv(runif(n)),
##D                 z=factor(sample(1:3, n, TRUE), 1:3,
##D                   c('elephant','giraffe','dog')))
##D ## Cannot have labels for variables; ff will reject as non-atomic vectors
##D storage.mode(d$y)
##D object.size(d)
##D n * (8 + 4 + 4 + 4)
##D f <- as.ffdf(d, vmode=c('single', 'quad', 'integer', 'single', 'quad'))
##D vmode(f)
##D n * (4 + 0.25 + 4 + 0.25)
##D object.size(as.data.frame(f))
##D f[1:10,]
##D hist(d[,'x'] - f[,'x'], nclass=100)
##D table(d[,'z'], f[,'z'])
##D 
##D system.time(subset(f, z == 'dog'))
##D system.time({i <- ffwhich(f, z == 'dog'); f[i,]})
##D table(subset(f, z == 'dog')[,'z'])
##D class(subset(f, z == 'dog'))
##D 
##D ffsave(f, file='/tmp/f')  # creates /tmp/f.ffData /tmp/f.RData
##D ## To load: ffload('/tmp/f')
##D 
##D d <- upData(d, labels=c(y='Y'), units=c(z='units z'))
##D f <- ffCompress(d)
##D vmode(f)
##D 
##D load('ras.rda')   # dataset is not available
##D r <- ffCompress(ras)
##D vmode(r)
##D attr(r, 'label')
##D attr(r, 'units')
##D all.equal(ras, as.data.frame(r))
##D dr <- as.data.frame(r)
##D g <- function(x) names(attributes(x))
##D nam <- names(dr)
##D for(i in 1 : ncol(dr)) {
##D   a <- ras[[i]]
##D   b <- dr[[i]]
##D   cat(nam[i], '\n')
##D   cat(g(a), '\n', g(b), '\n')
##D   cat(max(w <- abs(unclass(a) - unclass(b)), na.rm=TRUE), '\n')
##D   if(nam[i] == 'ldl') {
##D     j <- which.max(abs(w))
##D     cat(a[j], b[j], '\n')
##D   }
##D }
##D 
##D dr <- as.data.frame(r)
##D xless(contents(dr))
##D xless(contents(r[1:10,]))
##D xless(contents(r[,1:10]))
##D 
##D table(r[, 'gender'])
##D ## subset invokes [] so uses method from ffdflabel
##D m <- subset(r, gender == 'Male')
##D class(m)
##D dim(m)
##D attr(m, 'label')
##D attributes(m[,'age'])
##D df <- as.data.frame(m)
##D class(df$age)
##D label(df$age)
##D ## But if subset again things are not OK
##D k <- subset(m, age < 3)
##D class(k)
##D contents(k[, 'age', drop=FALSE])
##D invisible(ffsave(r, file='/tmp/r'))
##D 
##D ## w <- read.csv.ffdf(file='/tmp/data.csv', first.rows=10000)
##D ## table(vmode(w))
##D 
##D ## From ff manual:  vmode definitions
##D # boolean 1 bit logical without NA
##D # logical 2 bit logical with NA
##D # quad 2 bit unsigned integer without NA
##D # nibble 4 bit unsigned integer without NA
##D # byte 8 bit signed integer with NA
##D # ubyte 8 bit unsigned integer without NA
##D # short 16 bit signed integer with NA
##D # ushort 16 bit unsigned integer without NA
##D # integer 32 bit signed integer with NA
##D # single 32 bit float
##D # double 64 bit float
##D # complex 2x64 bit float
##D # raw 8 bit unsigned char
##D # character character
## End(Not run)



