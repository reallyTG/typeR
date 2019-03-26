library(inline)


### Name: cfunction
### Title: Inline C, C++, Fortran function calls from R
### Aliases: cfunction setCMethod
### Keywords: file

### ** Examples


x <- as.numeric(1:10)
n <- as.integer(10)

## Not run: 
##D ## A simple Fortran example - n and x: assumed-size vector
##D code <- "
##D       integer i
##D       do 1 i=1, n(1)
##D     1 x(i) = x(i)**3
##D "
##D cubefn <- cfunction(signature(n="integer", x="numeric"), code, convention=".Fortran")
##D print(cubefn)
##D 
##D cubefn(n, x)$x
##D 
##D ## Same Fortran example - now n is one number
##D code2 <- "
##D       integer i
##D       do 1 i=1, n 
##D     1 x(i) = x(i)**3
##D "
##D cubefn2 <- cfunction(signature(n="integer", x="numeric"), implicit = "none", 
##D   dim = c("", "(*)"), code2, convention=".Fortran")
##D 
##D cubefn2(n, x)$x
##D 
##D ## Same in F95, now x is fixed-size vector (length = n)
##D code3 <- "x = x*x*x"
##D cubefn3 <- cfunction(sig = signature(n="integer", x="numeric"), implicit = "none", 
##D   dim = c("", "(n)"), code3, language="F95")
##D cubefn3(20, 1:20)
##D print(cubefn3)
##D 
##D ## Same example in C
##D code4 <- "
##D       int i;
##D       for (i = 0; i < *n; i++) 
##D         x[i] = x[i]*x[i]*x[i];
##D "
##D cubefn4 <- cfunction(signature(n="integer", x="numeric"), code4, language = "C", convention = ".C")
##D cubefn4(20, 1:20)
##D 
## End(Not run)

 ## use of a module in F95
modct <- "module modcts
double precision, parameter :: pi = 3.14159265358979
double precision, parameter :: e = 2.71828182845905
end"

getconstants <- "x(1) = pi
x(2) = e"

cgetcts <- cfunction(getconstants, module = "modcts", implicit = "none",
  includes = modct, sig = c(x = "double"), dim = c("(2)"), language = "F95")

cgetcts(x = 1:2)  
print(cgetcts)

## Use of .C convention with C code
## Defining two functions, one of which calls the other
sigSq <- signature(n="integer", x="numeric")
codeSq <- "
  for (int i=0; i < *n; i++) {
    x[i] = x[i]*x[i];
  }"
sigQd <- signature(n="integer", x="numeric")
codeQd <- "
  squarefn(n, x);
  squarefn(n, x);
"

fns <- cfunction( list(squarefn=sigSq, quadfn=sigQd), 
                  list(codeSq, codeQd), 
                  convention=".C")

squarefn <- fns[["squarefn"]]
quadfn <- fns[["quadfn"]]

squarefn(n, x)$x
quadfn(n, x)$x

## Alternative declaration using 'setCMethod'
setCMethod(c("squarefn", "quadfn"), list(sigSq, sigQd), 
           list(codeSq, codeQd), convention=".C")
           
squarefn(n, x)$x
quadfn(n, x)$x

## Use of .Call convention with C code
## Multyplying each image in a stack with a 2D Gaussian at a given position
code <- "
  SEXP res;
  int nprotect = 0, nx, ny, nz, x, y;
  PROTECT(res = Rf_duplicate(a)); nprotect++;
  nx = INTEGER(GET_DIM(a))[0];
  ny = INTEGER(GET_DIM(a))[1];
  nz = INTEGER(GET_DIM(a))[2];
  double sigma2 = REAL(s)[0] * REAL(s)[0], d2 ;
  double cx = REAL(centre)[0], cy = REAL(centre)[1], *data, *rdata;
  for (int im = 0; im < nz; im++) {
    data = &(REAL(a)[im*nx*ny]); rdata = &(REAL(res)[im*nx*ny]);
    for (x = 0; x < nx; x++)
      for (y = 0; y < ny; y++) {
        d2 = (x-cx)*(x-cx) + (y-cy)*(y-cy);
        rdata[x + y*nx] = data[x + y*nx] * exp(-d2/sigma2);
      }
  }
  UNPROTECT(nprotect);
  return res;
"
funx <- cfunction(signature(a="array", s="numeric", centre="numeric"), code)

x <- array(runif(50*50), c(50,50,1))
res <- funx(a=x, s=10, centre=c(25,15))
if (interactive()) image(res[,,1])

## Same but done by registering an S4 method
setCMethod("funy", signature(a="array", s="numeric", centre="numeric"), code, verbose=TRUE)

res <- funy(x, 10, c(35,35))
if (interactive()) { x11(); image(res[,,1]) }




