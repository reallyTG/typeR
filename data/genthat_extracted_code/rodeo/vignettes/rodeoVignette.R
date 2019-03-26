## ---- echo=FALSE---------------------------------------------------------
# Store output format for later use
options(vignetteDocumentFormat= rmarkdown::all_output_formats("rodeoVignette.Rmd"))

## ----echo=FALSE-------------------------------------------------------------------------------------------------------
options(width=120) 
library(xtable)
options(xtable.caption.placement = 'top',
        xtable.include.rownames = FALSE,
        xtable.comment = FALSE,
        xtable.booktabs = TRUE
  )

## ---- echo=FALSE------------------------------------------------------------------------------------------------------
library(rodeo)
data(vars, pars, funs, pros, stoi)
knitr::kable(vars, caption="Data set `vars`: Declaration of state variables.")
knitr::kable(pars, caption="Data set `pars`: Declaration of parameters.")
knitr::kable(funs, caption="Data set `funs`: Declaration of functions referenced at the ODE's right hand sides.")
knitr::kable(pros, caption="Data set `pros`: Definition of process rates.")
knitr::kable(stoi, caption="Data set `stoi`: Definition of stoichiometric factors providing the relation between processes and state variables. Note the (optional) use of a tabular layout instead of the more common matrix layout.")

## ----loadExampleData, echo=TRUE---------------------------------------------------------------------------------------
rm(list=ls())     # Initial clean-up
library(deSolve)
library(rodeo)
data(vars, pars, pros, funs, stoi)

## ----initSingleBox, echo=TRUE-----------------------------------------------------------------------------------------
model <- rodeo$new(vars=vars, pars=pars, funs=funs,
  pros=pros, stoi=stoi, dim=c(1))

## ----inspectObject, echo=TRUE, eval=FALSE-----------------------------------------------------------------------------
#  print(model)                   # Displays object members (output not shown)
#  print(model$stoichiometry())   # Shows stoichiometry as a matrix

## ----defNormalFunctions, echo=TRUE, eval=TRUE-------------------------------------------------------------------------
monod <- function(c, h) { c / (c + h) }

## ----dataSingleBox, echo=TRUE, eval=TRUE------------------------------------------------------------------------------
model$setVars(c(bac=0.01, sub=0))
model$setPars(c(mu=0.8, half=0.1, yield= 0.1, vol=1000, flow=50, sub_in=1))

## ----showNumericStoi, echo=TRUE, eval=TRUE----------------------------------------------------------------------------
m <- model$stoichiometry(box=1, time=0)
print(signif(m, 3))

## ----generateSingleBoxR, echo=TRUE, eval=TRUE-------------------------------------------------------------------------
model$compile(fortran=FALSE)

## ----solveSingleBoxR, echo=TRUE, eval=FALSE, results='hide'-----------------------------------------------------------
#  out <- model$dynamics(times=0:96, fortran=FALSE)
#  plot(out)  # plot method for 'deSolve' objects

## ----ref.label='solveSingleBoxR', echo=FALSE, eval=TRUE---------------------------------------------------------------
out <- model$dynamics(times=0:96, fortran=FALSE)
plot(out)  # plot method for 'deSolve' objects

## ----ref.label='loadExampleData', echo=TRUE, eval=TRUE----------------------------------------------------------------
rm(list=ls())     # Initial clean-up
library(deSolve)
library(rodeo)
data(vars, pars, pros, funs, stoi)

## ----initMultiBox, echo=TRUE, eval=TRUE-------------------------------------------------------------------------------
nBox <- 2
model <- rodeo$new(vars=vars, pars=pars, funs=funs,
  pros=pros, stoi=stoi, dim=c(nBox))

## ----generateMultiBoxR, echo=TRUE, eval=TRUE--------------------------------------------------------------------------
model$compile(fortran=FALSE)

## ----ref.label='defNormalFunctions', echo=TRUE, eval=TRUE-------------------------------------------------------------
monod <- function(c, h) { c / (c + h) }

## ----dataMultiBox, echo=TRUE, eval=TRUE-------------------------------------------------------------------------------
rp <- function (x) {rep(x, nBox)}    # For convenient replication
v <- cbind(bac=rp(0.01), sub=rp(0))
model$setVars(v)
p <- cbind(mu=rp(0.8), half=rp(0.1), yield= rp(0.1),
  vol=c(300, 1000), flow=rp(50), sub_in=rp(1))
model$setPars(p)

## ----solveMultiBoxR, echo=TRUE, eval=TRUE-----------------------------------------------------------------------------
out <- model$dynamics(times=0:120, fortran=FALSE)

## ----plotMultiBox, echo=TRUE, eval=TRUE, fig.show='hold', fig.height=4------------------------------------------------
layout(matrix(1:model$lenVars(), nrow=1))
for (vn in model$namesVars()) {
  matplot(out[,"time"], out[,paste(vn, 1:nBox, sep=".")],
    type="l", xlab="time", ylab=vn, lty=1:nBox, col=1:nBox)
  legend("right", bty="n", lty=1:nBox, col=1:nBox, legend=paste("box",1:nBox))
}
layout(1)

## ----echo=FALSE-------------------------------------------------------------------------------------------------------
x <- rbind(
 c("1", "x.1", "x.2"),
 c("2", "x.1", "x.3"),
 c("3", "x.2", "x.4"),
 c("4", "x.3", "x.5"),
 c("5 (highest index)", "x.4", "x.5")
)
colnames(x) <- c("Box index","left(x) returns","right(x) returns")
knitr::kable(as.data.frame(x, check.names=FALSE))

## ----ref.label='loadExampleData', echo=TRUE, eval=TRUE----------------------------------------------------------------
rm(list=ls())     # Initial clean-up
library(deSolve)
library(rodeo)
data(vars, pars, pros, funs, stoi)

## ----alterExampleData, echo=TRUE, eval=TRUE---------------------------------------------------------------------------
pars <- rbind(pars,
  c(name="d", unit="1/hour", description="diffusion parameter")
)
pros <- rbind(pros,
  c(name="diffSub", unit="mg/ml/hour", description="diffusion of substrate",
    expression="d * ((left(sub)-sub) + (right(sub)-sub))")
)
stoi <- rbind(stoi,
  c(variable="sub", process="diffSub", expression="1")
)

## ----ref.label='initMultiBox', echo=TRUE, eval=TRUE-------------------------------------------------------------------
nBox <- 2
model <- rodeo$new(vars=vars, pars=pars, funs=funs,
  pros=pros, stoi=stoi, dim=c(nBox))

## ----ref.label='generateMultiBoxR', echo=TRUE, eval=TRUE--------------------------------------------------------------
model$compile(fortran=FALSE)

## ----ref.label='defNormalFunctions', echo=TRUE, eval=TRUE-------------------------------------------------------------
monod <- function(c, h) { c / (c + h) }

## ----dataMultiBoxInteracting, echo=TRUE, eval=TRUE--------------------------------------------------------------------
rp <- function (x) {rep(x, nBox)}    # For convenient replication
v <- cbind(bac=rp(0.01), sub=rp(0))
model$setVars(v)
p <- cbind(mu=rp(0.8), half=rp(0.1), yield= rp(0.1),
  vol=c(300, 1000), flow=rp(50), sub_in=rp(1),
  d=rp(.75))                          # Added diffusion parameter
model$setPars(p)

## ----ref.label='solveMultiBoxR', echo=TRUE, eval=TRUE-----------------------------------------------------------------
out <- model$dynamics(times=0:120, fortran=FALSE)

## ----ref.label='plotMultiBox', echo=TRUE, eval=FALSE------------------------------------------------------------------
#  layout(matrix(1:model$lenVars(), nrow=1))
#  for (vn in model$namesVars()) {
#    matplot(out[,"time"], out[,paste(vn, 1:nBox, sep=".")],
#      type="l", xlab="time", ylab=vn, lty=1:nBox, col=1:nBox)
#    legend("right", bty="n", lty=1:nBox, col=1:nBox, legend=paste("box",1:nBox))
#  }
#  layout(1)

## ----ref.label='plotMultiBox', echo=FALSE, eval=TRUE, fig.height=4----------------------------------------------------
layout(matrix(1:model$lenVars(), nrow=1))
for (vn in model$namesVars()) {
  matplot(out[,"time"], out[,paste(vn, 1:nBox, sep=".")],
    type="l", xlab="time", ylab=vn, lty=1:nBox, col=1:nBox)
  legend("right", bty="n", lty=1:nBox, col=1:nBox, legend=paste("box",1:nBox))
}
layout(1)

## ----echo=TRUE, eval=FALSE--------------------------------------------------------------------------------------------
#  code <- model$generate(name="derivs",lang="f95")    # not required for typical uses

## ----compileMultiBox, echo=TRUE, eval=FALSE---------------------------------------------------------------------------
#  model$compile(sources="vignetteData/fortran/functionsCode.f95")

## ----echo=FALSE, eval=TRUE, comment=''--------------------------------------------------------------------------------
file_ffuns <- "vignetteData/fortran/functionsCode.f95"
text <- readLines(file_ffuns, n=-1L, ok=TRUE, warn=TRUE, encoding="unknown", skipNul=FALSE)
text <- paste(text,"\n")
cat(text)

## ----ref.label='loadExampleData', echo=TRUE, eval=TRUE----------------------------------------------------------------
rm(list=ls())     # Initial clean-up
library(deSolve)
library(rodeo)
data(vars, pars, pros, funs, stoi)

## ----ref.label='initMultiBox', echo=TRUE, eval=TRUE-------------------------------------------------------------------
nBox <- 2
model <- rodeo$new(vars=vars, pars=pars, funs=funs,
  pros=pros, stoi=stoi, dim=c(nBox))

## ----ref.label='dataMultiBox', echo=TRUE, eval=TRUE-------------------------------------------------------------------
rp <- function (x) {rep(x, nBox)}    # For convenient replication
v <- cbind(bac=rp(0.01), sub=rp(0))
model$setVars(v)
p <- cbind(mu=rp(0.8), half=rp(0.1), yield= rp(0.1),
  vol=c(300, 1000), flow=rp(50), sub_in=rp(1))
model$setPars(p)

## ----ref.label='compileMultiBox', echo=TRUE, eval=TRUE----------------------------------------------------------------
model$compile(sources="vignetteData/fortran/functionsCode.f95")

## ----solveMultiBoxF, echo=TRUE, eval=TRUE-----------------------------------------------------------------------------
out <- model$dynamics(times=0:120)

## ----ref.label='plotMultiBox', echo=TRUE, eval=FALSE------------------------------------------------------------------
#  layout(matrix(1:model$lenVars(), nrow=1))
#  for (vn in model$namesVars()) {
#    matplot(out[,"time"], out[,paste(vn, 1:nBox, sep=".")],
#      type="l", xlab="time", ylab=vn, lty=1:nBox, col=1:nBox)
#    legend("right", bty="n", lty=1:nBox, col=1:nBox, legend=paste("box",1:nBox))
#  }
#  layout(1)

## ----ref.label='plotMultiBox', echo=FALSE, eval=TRUE, fig.height=4----------------------------------------------------
layout(matrix(1:model$lenVars(), nrow=1))
for (vn in model$namesVars()) {
  matplot(out[,"time"], out[,paste(vn, 1:nBox, sep=".")],
    type="l", xlab="time", ylab=vn, lty=1:nBox, col=1:nBox)
  legend("right", bty="n", lty=1:nBox, col=1:nBox, legend=paste("box",1:nBox))
}
layout(1)

## ----echo=TRUE, eval=TRUE---------------------------------------------------------------------------------------------
dat <- data.frame(time=1:10, temp=round(rnorm(n=10, mean=20, sd=3)),
  humid=round(runif(10)*100))
tmpdir <- normalizePath(tempdir())
write.table(x=dat, file=paste0(tmpdir,"/meteo.txt"), col.names=TRUE,
  row.names=FALSE, sep="\t", quote=FALSE)
print(dat)

## ----echo=TRUE, eval=TRUE---------------------------------------------------------------------------------------------
dat <- data.frame(name=c("temp","humid"),
  column=c("temp","humid"), file=paste0(tmpdir,"/meteo.txt"), mode=-1, default=FALSE)
code <- forcingFunctions(dat)
write(x=code, file=paste0(tmpdir,"/forc.f95"))

## ----eval=TRUE, echo=FALSE, comment=''--------------------------------------------------------------------------------
text <- readLines("vignetteData/fortran/fortranForcingsTest.f95",
  n=-1L, ok=TRUE, warn=TRUE, encoding="unknown", skipNul=FALSE)
text <- paste(text,"\n")
cat(text)

## ----exportTex, echo=TRUE, eval=FALSE---------------------------------------------------------------------------------
#  # Select columns to export
#  df <- model$getVarsTable()[,c("tex","unit","description")]
#  # Define formatting functions
#  bold <- function(x){paste0("\\textbf{",x,"}")}
#  mathmode <- function(x) {paste0("$",x,"$")}
#  # Export
#  tex <- exportDF(x=df, tex=TRUE,
#    colnames=c(tex="symbol"),
#    funHead=setNames(replicate(ncol(df),bold),names(df)),
#    funCell=list(tex=mathmode)
#  )
#  cat(tex)

## ----ref.label='exportTex', echo=FALSE, eval=TRUE, comment=''---------------------------------------------------------
# Select columns to export
df <- model$getVarsTable()[,c("tex","unit","description")]
# Define formatting functions
bold <- function(x){paste0("\\textbf{",x,"}")}
mathmode <- function(x) {paste0("$",x,"$")}
# Export
tex <- exportDF(x=df, tex=TRUE,
  colnames=c(tex="symbol"),
  funHead=setNames(replicate(ncol(df),bold),names(df)),
  funCell=list(tex=mathmode)
)
cat(tex)

## ----exportMarkdown, echo=TRUE, eval=FALSE----------------------------------------------------------------------------
#  knitr::kable(model$getVarsTable()[,c("name","unit","description")])

## ----ref.label='exportMarkdown', echo=FALSE, eval=TRUE, comment=''----------------------------------------------------
knitr::kable(model$getVarsTable()[,c("name","unit","description")])

## ----plotStoichiometry, echo=TRUE, eval=FALSE-------------------------------------------------------------------------
#  model$plotStoichiometry(box=1, time=0, cex=0.8)

## ----echo=FALSE, eval=TRUE--------------------------------------------------------------------------------------------
omar <- par("mar")
par(mar=c(0,4,4,0))

## ----ref.label='plotStoichiometry', echo=FALSE, eval=TRUE, fig.width=2, fig.height=2.5--------------------------------
model$plotStoichiometry(box=1, time=0, cex=0.8)

## ----echo=FALSE, eval=TRUE--------------------------------------------------------------------------------------------
par(mar=omar)

## ----echo=TRUE, eval=TRUE---------------------------------------------------------------------------------------------
signsymbol <- function(x) {
  if (as.numeric(x) > 0) return("\\textcolor{red}{$\\blacktriangle$}")
  if (as.numeric(x) < 0) return("\\textcolor{blue}{$\\blacktriangledown$}")
  return("")
}
rot90 <- function(x) { paste0("\\rotatebox{90}
  {$",gsub(pattern="*", replacement="\\cdot ", x=x, fixed=TRUE),"$}") }
m <- model$stoichiometry(box=1, time=0)
tbl <- cbind(data.frame(process=rownames(m), stringsAsFactors=FALSE),
  as.data.frame(m))
tex <- exportDF(x=tbl, tex=TRUE,
  colnames= setNames(c("",model$getVarsTable()$tex[match(colnames(m),
    model$getVarsTable()$name)]), names(tbl)),
  funHead= setNames(replicate(ncol(m),rot90), colnames(m)),
  funCell= setNames(replicate(ncol(m),signsymbol), colnames(m)),
  lines=TRUE
)
tex <- paste0("%\n% THIS IS A GENERATED FILE\n%\n", tex)
# write(tex, file="stoichiometry.tex")

## ----echo=TRUE, eval=TRUE---------------------------------------------------------------------------------------------
signsymbol <- function(x) {
  if (as.numeric(x) > 0) return("&#9651;")
  if (as.numeric(x) < 0) return("&#9661;")
  return("")
}
m <- model$stoichiometry(box=1, time=0)
tbl <- cbind(data.frame(process=rownames(m), stringsAsFactors=FALSE),
  as.data.frame(m))
html <- exportDF(x=tbl, tex=FALSE,
  colnames= setNames(c("Process",model$getVarsTable()$html[match(colnames(m),
    model$getVarsTable()$name)]), names(tbl)),
  funCell= setNames(replicate(ncol(m),signsymbol), colnames(m))
)
html <- paste("<html>", html, "</html>", sep="\n")
# write(html, file="stoichiometry.html")

## ----stoiMarkdown, echo=TRUE, eval=FALSE------------------------------------------------------------------------------
#  signsymbol <- function(x) {
#    if (as.numeric(x) > 0) return("$\\color{red}{\\blacktriangle}$")
#    if (as.numeric(x) < 0) return("$\\color{blue}{\\blacktriangledown}$")
#    return("")
#  }
#  m <- model$stoichiometry(box=1, time=0)
#  m <- apply(m, MARGIN = c(1, 2), signsymbol)
#  knitr::kable(m)

## ----ref.label='stoiMarkdown', echo=FALSE, eval=TRUE------------------------------------------------------------------
signsymbol <- function(x) {
  if (as.numeric(x) > 0) return("$\\color{red}{\\blacktriangle}$")
  if (as.numeric(x) < 0) return("$\\color{blue}{\\blacktriangledown}$")
  return("")
}
m <- model$stoichiometry(box=1, time=0)
m <- apply(m, MARGIN = c(1, 2), signsymbol)
knitr::kable(m)

## ----echo=FALSE-------------------------------------------------------------------------------------------------------
x <- rbind(
 c("Portability across programs and operating systems", "+", "(-)"),
 c("Suitability for version control", "+", "-"),
 c("Editing with regular expressions", "+", "-"),
 c("Syntax highlight for expressions", "(+)", "-"),
 c("Display table with proper alignment of columns", "-", "+"),
 c("View multiple tables at a time", "+", "(-)") 
)
colnames(x) <- c("Feature","Delimited text","Spreadsheet")
knitr::kable(as.data.frame(x))

## ---- stoiCreate, echo=FALSE------------------------------------------------------------------------------------------
reactions <- c(
  formationS= "A + 2 * B -> S",
  equilibrES= "E + S <-> ES",
  decomposES= "ES -> E + P"
)
stoiMat <- stoiCreate(reactions, eval=TRUE, toRight="_fward", toLeft="_bward")
print(stoiMat)

## ---- ref.label='stoiCreate', echo=TRUE, eval=FALSE-------------------------------------------------------------------
#  reactions <- c(
#    formationS= "A + 2 * B -> S",
#    equilibrES= "E + S <-> ES",
#    decomposES= "ES -> E + P"
#  )
#  stoiMat <- stoiCreate(reactions, eval=TRUE, toRight="_fward", toLeft="_bward")
#  print(stoiMat)

## ---------------------------------------------------------------------------------------------------------------------
reac <- c(oxidation="C6H12O6 + 6 * O2 -> 6 * CO2 + 6 * H2O")
stoiMat <- stoiCreate(reactions=reac)
print(stoiMat)

## ---------------------------------------------------------------------------------------------------------------------
compMat <- rbind(
  Hdyrogen= c(C6H12O6= 12, O2=0, CO2=0, H2O=2),
  Oxygen=   c(C6H12O6= 6,  O2=2, CO2=2, H2O=1),
  Carbon=   c(C6H12O6= 6,  O2=0, CO2=1, H2O=0)
)
stoiCheck(stoiMat, compMat)

## ---- cache=FALSE, echo=FALSE-----------------------------------------------------------------------------------------
# Set work folder
knitr::opts_knit$set(root.dir="examples/0D/streeterPhelpsLike")

## ---- echo=FALSE, results='asis', comment=''--------------------------------------------------------------------------
rd <- function(f) {read.table(f,sep="\t", header=TRUE)}
knitr::kable(rd("vars.txt"), caption="Declaration of state variables (file 'vars.txt').")
knitr::kable(rd("pars.txt"), caption="Declaration of parameters (file 'pars.txt').")
knitr::kable(rd("funs.txt"), caption="Declaration of functions (file 'funs.txt').")
knitr::kable(rd("pros.txt"), caption="Definition of process rates (file 'pros.txt').")
knitr::kable(rd("stoi.txt"), caption="Definition of stoichiometric factors (file 'stoi.txt').")

## ----cache=FALSE, echo=FALSE------------------------------------------------------------------------------------------
knitr::read_chunk("xecute.r")

## ----ref.label='streeterPhelpsLike', echo=TRUE, eval=FALSE------------------------------------------------------------
#  rm(list=ls())
#  
#  # Adjustable settings ##########################################################
#  pars <- c(kd=1, ka=0.5, s=2.76, temp=20)  # parameters
#  vars <- c(OM=1, DO=9.02)                  # initial values
#  times <- seq(from=0, to=10, by=1/24)      # times of interest
#  # End of settings ##############################################################
#  
#  # Load required packages
#  library("deSolve")
#  library("rodeo")
#  
#  # Initialize rodeo object
#  rd <- function(f, ...) {read.table(file=f,
#    header=TRUE, sep="\t", stringsAsFactors=FALSE, ...) }
#  model <- rodeo$new(vars=rd("vars.txt"), pars=rd("pars.txt"), funs=rd("funs.txt"),
#    pros=rd("pros.txt"), stoi=as.matrix(rd("stoi.txt", row.names="process")),
#    asMatrix=TRUE, dim=c(1))
#  
#  # Assign initial values and parameters
#  model$setVars(vars)
#  model$setPars(pars)
#  
#  # Implement required functions
#  DOsat <- function(t) {
#    14.652 - 0.41022*t + 7.991e-3*(t**2) - 7.7774e-5*(t**3)
#  }
#  
#  # Generate R code
#  model$compile(fortran=FALSE)
#  
#  # Integrate
#  out <- model$dynamics(times=times, fortran=FALSE)
#  
#  # Plot, using the method for objects of class deSolve
#  plot(out)

## ----ref.label='streeterPhelpsLike', echo=FALSE, eval=TRUE, fig.height=6----------------------------------------------
rm(list=ls())

# Adjustable settings ##########################################################
pars <- c(kd=1, ka=0.5, s=2.76, temp=20)  # parameters
vars <- c(OM=1, DO=9.02)                  # initial values
times <- seq(from=0, to=10, by=1/24)      # times of interest
# End of settings ##############################################################

# Load required packages
library("deSolve")
library("rodeo")

# Initialize rodeo object
rd <- function(f, ...) {read.table(file=f,
  header=TRUE, sep="\t", stringsAsFactors=FALSE, ...) }
model <- rodeo$new(vars=rd("vars.txt"), pars=rd("pars.txt"), funs=rd("funs.txt"),
  pros=rd("pros.txt"), stoi=as.matrix(rd("stoi.txt", row.names="process")),
  asMatrix=TRUE, dim=c(1))

# Assign initial values and parameters
model$setVars(vars)
model$setPars(pars)

# Implement required functions
DOsat <- function(t) {
  14.652 - 0.41022*t + 7.991e-3*(t**2) - 7.7774e-5*(t**3)
}

# Generate R code
model$compile(fortran=FALSE)

# Integrate
out <- model$dynamics(times=times, fortran=FALSE)

# Plot, using the method for objects of class deSolve
plot(out)   

## ---- cache=FALSE, echo=FALSE-----------------------------------------------------------------------------------------
# Reset work folder
knitr::opts_knit$set(root.dir=NULL)

## ---- cache=FALSE, echo=FALSE-----------------------------------------------------------------------------------------
# Set work folder
knitr::opts_knit$set(root.dir="examples/0D/twoZonesStirredTank")

## ---- echo=FALSE, results='asis', comment=''--------------------------------------------------------------------------
rd <- function(f) {read.table(f ,sep="\t", header=TRUE)}
knitr::kable(rd("vars.txt"), caption="Declaration of state variables (file 'vars.txt').")
knitr::kable(rd("pars.txt"), caption="Declaration of parameters (file 'pars.txt').")
#knitr::kable(rd("funs.txt"), caption="Declaration of functions (file 'funs.txt').")
knitr::kable(rd("pros.txt"), caption="Definition of process rates (file 'pros.txt').")
knitr::kable(rd("stoi.txt"), caption="Definition of stoichiometric factors (file 'stoi.txt').")

## ----cache=FALSE, echo=FALSE------------------------------------------------------------------------------------------
knitr::read_chunk("xecute.r")

## ----ref.label='twoZonesStirredTank', echo=TRUE, eval=FALSE-----------------------------------------------------------
#  rm(list=ls())
#  
#  # Adjustable settings ##########################################################
#  vars <- c(bM=0, bS=0, sM=0, sS=0)                       # initial values
#  pars <- c(vol=1000, fS=NA, qM=200, qS=NA,               # fixed parameter values
#    bX=1, sX=20, mu=NA, yield=0.1, half=0.1)
#  sensList <- list(                                       # parameter values for
#    fS= seq(from=0.02, to=0.5, by=0.02),                  # sensitivity analysis
#    qS= seq(from=2, to=200, by=2),
#    mu= c(0.07, 0.1, 0.15)
#  )
#  commonScale <- TRUE                                     # controls color scale
#  # End of settings ##############################################################
#  
#  # Load packages
#  library("rootSolve")
#  library("rodeo")
#  
#  # Initialize rodeo object
#  rd <- function(f, ...) {read.table(file=f,
#    header=TRUE, sep="\t", stringsAsFactors=FALSE, ...) }
#  model <- rodeo$new(vars=rd("vars.txt"), pars=rd("pars.txt"), funs=NULL,
#    pros=rd("pros.txt"), stoi=as.matrix(rd("stoi.txt", row.names="process")),
#    asMatrix=TRUE, dim=c(1))
#  
#  # Assign initial values and parameters
#  model$setVars(vars)
#  model$setPars(pars)
#  
#  # Generate code, compile into shared library, load library
#  model$compile(NULL)
#  
#  # Function to return the steady-state solution for specific parameters
#  f <- function(x) {
#    testPars <- pars
#    testPars[names(sensList)] <- x[names(sensList)]
#    model$setPars(testPars)
#    st <- rootSolve::runsteady(y=model$getVars(), times=c(0, Inf),
#      func=model$libFunc(), parms=model$getPars(), dllname=model$libName(),
#      nout=model$lenPros(), outnames=model$namesPros())
#    if (!attr(st, "steady"))
#      st$y <- rep(NA, length(st$y))
#    setNames(st$y, model$namesVars())
#  }
#  
#  # Set up parameter sets
#  sensSets <- expand.grid(sensList)
#  
#  # Apply model to all sets and store results as array
#  out <- array(apply(sensSets, 1, f),
#    dim=c(model$lenVars(), lapply(sensList, length)),
#    dimnames=c(list(model$namesVars()), sensList))
#  
#  # Plot results of sensitivity analysis
#  xlab <- "Sub-tank volume / Total vol."
#  ylab <- "Flow through sub-tank"
#  VAR <- c("bM", "bS")
#  MU <- as.character(sensList[["mu"]])
#  
#  if (commonScale) {
#    breaks <- pretty(out[VAR,,,MU], 15)
#    colors <- colorRampPalette(c("steelblue2","lightyellow","orange2"))(length(breaks)-1)
#  }
#  
#  layout(matrix(1:((length(VAR)+1)*length(MU)), ncol=length(VAR)+1,
#    nrow=length(MU), byrow=TRUE))
#  for (mu in MU) {
#    if (!commonScale) {
#      breaks <- pretty(out[VAR,,,mu], 15)
#      colors <- colorRampPalette(c("steelblue2","lightyellow","orange2"))(length(breaks)-1)
#    }
#    for (var in VAR) {
#      image(x=as.numeric(rownames(out[var,,,mu])),
#        y=as.numeric(colnames(out[var,,,mu])), z=out[var,,,mu],
#        breaks=breaks, col=colors, xlab=xlab, ylab=ylab)
#      mtext(side=3, var, cex=par("cex"))
#      legend("topright", bty="n", legend=paste("mu=",mu))
#    }
#    plot.new()
#    br <- round(breaks, 1)
#    legend("topleft", bty="n", ncol= 2, fill=colors,
#      legend=paste(br[-length(br)],br[-1],sep="-"))
#  }
#  layout(1)

## ----ref.label='twoZonesStirredTank', echo=FALSE, eval=TRUE, fig.height=8---------------------------------------------
rm(list=ls())

# Adjustable settings ##########################################################
vars <- c(bM=0, bS=0, sM=0, sS=0)                       # initial values
pars <- c(vol=1000, fS=NA, qM=200, qS=NA,               # fixed parameter values
  bX=1, sX=20, mu=NA, yield=0.1, half=0.1)
sensList <- list(                                       # parameter values for
  fS= seq(from=0.02, to=0.5, by=0.02),                  # sensitivity analysis
  qS= seq(from=2, to=200, by=2),
  mu= c(0.07, 0.1, 0.15)
)
commonScale <- TRUE                                     # controls color scale
# End of settings ##############################################################

# Load packages
library("rootSolve")
library("rodeo")

# Initialize rodeo object
rd <- function(f, ...) {read.table(file=f,
  header=TRUE, sep="\t", stringsAsFactors=FALSE, ...) }
model <- rodeo$new(vars=rd("vars.txt"), pars=rd("pars.txt"), funs=NULL,
  pros=rd("pros.txt"), stoi=as.matrix(rd("stoi.txt", row.names="process")),
  asMatrix=TRUE, dim=c(1))

# Assign initial values and parameters
model$setVars(vars)
model$setPars(pars)

# Generate code, compile into shared library, load library
model$compile(NULL)

# Function to return the steady-state solution for specific parameters
f <- function(x) {
  testPars <- pars
  testPars[names(sensList)] <- x[names(sensList)]
  model$setPars(testPars)
  st <- rootSolve::runsteady(y=model$getVars(), times=c(0, Inf),
    func=model$libFunc(), parms=model$getPars(), dllname=model$libName(),
    nout=model$lenPros(), outnames=model$namesPros())
  if (!attr(st, "steady"))
    st$y <- rep(NA, length(st$y))
  setNames(st$y, model$namesVars())
}

# Set up parameter sets
sensSets <- expand.grid(sensList)

# Apply model to all sets and store results as array
out <- array(apply(sensSets, 1, f),
  dim=c(model$lenVars(), lapply(sensList, length)),
  dimnames=c(list(model$namesVars()), sensList))

# Plot results of sensitivity analysis
xlab <- "Sub-tank volume / Total vol." 
ylab <- "Flow through sub-tank"
VAR <- c("bM", "bS")
MU <- as.character(sensList[["mu"]])

if (commonScale) {
  breaks <- pretty(out[VAR,,,MU], 15)
  colors <- colorRampPalette(c("steelblue2","lightyellow","orange2"))(length(breaks)-1)
}

layout(matrix(1:((length(VAR)+1)*length(MU)), ncol=length(VAR)+1,
  nrow=length(MU), byrow=TRUE))
for (mu in MU) {
  if (!commonScale) {
    breaks <- pretty(out[VAR,,,mu], 15)
    colors <- colorRampPalette(c("steelblue2","lightyellow","orange2"))(length(breaks)-1)
  }
  for (var in VAR) {
    image(x=as.numeric(rownames(out[var,,,mu])),
      y=as.numeric(colnames(out[var,,,mu])), z=out[var,,,mu],
      breaks=breaks, col=colors, xlab=xlab, ylab=ylab)
    mtext(side=3, var, cex=par("cex"))
    legend("topright", bty="n", legend=paste("mu=",mu))
  }
  plot.new()
  br <- round(breaks, 1)
  legend("topleft", bty="n", ncol= 2, fill=colors,
    legend=paste(br[-length(br)],br[-1],sep="-"))
}
layout(1)

## ---- cache=FALSE, echo=FALSE-----------------------------------------------------------------------------------------
# Reset work folder
knitr::opts_knit$set(root.dir=NULL)

## ---- cache=FALSE, echo=FALSE-----------------------------------------------------------------------------------------
# Set work folder
knitr::opts_knit$set(root.dir="examples/1D/diffusion")

## ---- echo=FALSE, results='asis', comment=''--------------------------------------------------------------------------
rd <- function(f) {read.table(f ,sep="\t", header=TRUE)}
knitr::kable(rd("vars.txt"), caption="Declaration of state variables (file 'vars.txt').")
knitr::kable(rd("pars.txt"), caption="Declaration of parameters (file 'pars.txt').")
knitr::kable(rd("pros.txt"), caption="Definition of process rates (file 'pros.txt').")
knitr::kable(rd("stoi.txt"), caption="Definition of stoichiometric factors (file 'stoi.txt').")

## ----cache=FALSE, echo=FALSE------------------------------------------------------------------------------------------
knitr::read_chunk("xecute.r")

## ----ref.label='diffusion', echo=TRUE, eval=FALSE---------------------------------------------------------------------
#  rm(list=ls())
#  
#  # Adjustable settings ##########################################################
#  dx <- 0.01                           # spatial discretization (m)
#  nCells <- 100                        # number of layers (-)
#  d <- 5e-9                            # diffusion coefficient (m2/s)
#  cb <- 1                              # boundary concentr. at all times (mol/m3)
#  times <- c(0,1,6,14,30,89)*86400     # times of interest (seconds)
#  # End of settings ##############################################################
#  
#  # Load packages
#  library("deSolve")
#  library("rodeo")
#  
#  # Initialize rodeo object
#  rd <- function(f, ...) {read.table(file=f,
#    header=TRUE, sep="\t", stringsAsFactors=FALSE, ...) }
#  model <- rodeo$new(vars=rd("vars.txt"), pars=rd("pars.txt"), funs=NULL,
#    pros=rd("pros.txt"), stoi=as.matrix(rd("stoi.txt", row.names="process")),
#    asMatrix=TRUE, dim=c(nCells))
#  
#  # Assign initial values and parameters
#  model$setVars(cbind(c=rep(0, nCells)))
#  model$setPars(cbind(d=d, dx=dx,cb=cb,
#    leftmost= c(1, rep(0, nCells-1))
#  ))
#  
#  # Generate code, compile into shared library, load library
#  model$compile(NULL)
#  
#  # Numeric solution
#  solNum <- model$dynamics(times=times, jactype="bandint", bandup=1, banddown=1)
#  
#  # Function providing the analytical solution
#  erfc <- function(x) { 2 * pnorm(x * sqrt(2), lower=FALSE) }
#  solAna <- function (x,t,d,cb) { cb * erfc(x / 2 / sqrt(d*t)) }
#  
#  # Graphically compare numerical and analytical solution
#  nc <- 2
#  nr <- ceiling(length(times) / nc)
#  layout(matrix(1:(nc*nr), ncol=nc, byrow=TRUE))
#  par(mar=c(4,4,1,1))
#  for (t in times) {
#    plot(c(0,nCells*dx), c(0,cb), type="n", xlab="Station (m)", ylab="mol/m3")
#    # Numeric solution (stair steps of cell-average)
#    stations <- seq(from=0, by=dx, length.out=nCells+1)
#    concs <- solNum[solNum[,1]==t, paste0("c.",1:nCells)]
#    lines(stations, c(concs,concs[length(concs)]), type="s", col="steelblue4")
#    # Analytical solution (for center of cells)
#    stations <- seq(from=dx/2, to=(nCells*dx)-dx/2, by=dx)
#    concs <- solAna(x=stations, t=t, d=d, cb=cb)
#    lines(stations, concs, col="red", lty=2)
#    # Extras
#    legend("topright", bty="n", paste("After",t/86400,"days"))
#    if (t == times[1]) legend("right",lty=1:2,
#      col=c("steelblue4","red"),legend=c("Numeric", "Exact"),bty="n")
#    abline(v=0)
#  }
#  layout(1)

## ----ref.label='diffusion', echo=FALSE, eval=TRUE---------------------------------------------------------------------
rm(list=ls())

# Adjustable settings ##########################################################
dx <- 0.01                           # spatial discretization (m)
nCells <- 100                        # number of layers (-)                           
d <- 5e-9                            # diffusion coefficient (m2/s)
cb <- 1                              # boundary concentr. at all times (mol/m3)
times <- c(0,1,6,14,30,89)*86400     # times of interest (seconds)
# End of settings ##############################################################

# Load packages
library("deSolve")
library("rodeo")

# Initialize rodeo object
rd <- function(f, ...) {read.table(file=f,
  header=TRUE, sep="\t", stringsAsFactors=FALSE, ...) }
model <- rodeo$new(vars=rd("vars.txt"), pars=rd("pars.txt"), funs=NULL,
  pros=rd("pros.txt"), stoi=as.matrix(rd("stoi.txt", row.names="process")),
  asMatrix=TRUE, dim=c(nCells))

# Assign initial values and parameters
model$setVars(cbind(c=rep(0, nCells)))
model$setPars(cbind(d=d, dx=dx,cb=cb,
  leftmost= c(1, rep(0, nCells-1))
))

# Generate code, compile into shared library, load library
model$compile(NULL)              

# Numeric solution
solNum <- model$dynamics(times=times, jactype="bandint", bandup=1, banddown=1)

# Function providing the analytical solution
erfc <- function(x) { 2 * pnorm(x * sqrt(2), lower=FALSE) }
solAna <- function (x,t,d,cb) { cb * erfc(x / 2 / sqrt(d*t)) }

# Graphically compare numerical and analytical solution
nc <- 2
nr <- ceiling(length(times) / nc)
layout(matrix(1:(nc*nr), ncol=nc, byrow=TRUE))
par(mar=c(4,4,1,1))
for (t in times) {
  plot(c(0,nCells*dx), c(0,cb), type="n", xlab="Station (m)", ylab="mol/m3")
  # Numeric solution (stair steps of cell-average)
  stations <- seq(from=0, by=dx, length.out=nCells+1)
  concs <- solNum[solNum[,1]==t, paste0("c.",1:nCells)]
  lines(stations, c(concs,concs[length(concs)]), type="s", col="steelblue4")
  # Analytical solution (for center of cells)
  stations <- seq(from=dx/2, to=(nCells*dx)-dx/2, by=dx)
  concs <- solAna(x=stations, t=t, d=d, cb=cb)
  lines(stations, concs, col="red", lty=2)
  # Extras
  legend("topright", bty="n", paste("After",t/86400,"days"))
  if (t == times[1]) legend("right",lty=1:2,
    col=c("steelblue4","red"),legend=c("Numeric", "Exact"),bty="n")
  abline(v=0)
}
layout(1)

## ---- cache=FALSE, echo=FALSE-----------------------------------------------------------------------------------------
# Reset work folder
knitr::opts_knit$set(root.dir=NULL)

## ---- cache=FALSE, echo=FALSE-----------------------------------------------------------------------------------------
# Set work folder
knitr::opts_knit$set(root.dir="examples/1D/advectionDispersion")

## ---- echo=FALSE, results='asis', comment=''--------------------------------------------------------------------------
rd <- function(f) {read.table(f,sep="\t", header=TRUE)}
knitr::kable(rd("vars.txt"), caption="Declaration of state variables (file 'vars.txt').")
knitr::kable(rd("pars.txt"), caption="Declaration of parameters (file 'pars.txt').")
knitr::kable(rd("funs.txt"), caption="Declaration of functions (file 'funs.txt').")
knitr::kable(rd("pros.txt"), caption="Definition of process rates (file 'pros.txt').")
knitr::kable(rd("stoi.txt"), caption="Definition of stoichiometric factors (file 'stoi.txt').")

## ----echo=FALSE, eval=TRUE, comment=''--------------------------------------------------------------------------------
f <- "functions.f95"
text <- readLines(f, n=-1L, ok=TRUE, warn=TRUE, encoding="unknown", skipNul=FALSE)
cat(paste(text,"\n"))

## ----cache=FALSE, echo=FALSE------------------------------------------------------------------------------------------
knitr::read_chunk("xecute.r")

## ----ref.label='advectionDispersion', echo=TRUE, eval=FALSE-----------------------------------------------------------
#  rm(list=ls())
#  
#  # Adjustable settings ##########################################################
#  fileFun <- "functions.f95"
#  u <- 1                                 # advective velocity (m/s)
#  d <- 30                                # longit. dispersion coefficient (m2/s)
#  wetArea <- 50                          # wet cross-section area (m2)
#  dx <- 10                               # length of a sub-section (m)
#  nCells <- 1000                         # number of sub-sections
#  inputCell <- 100                       # index of sub-section with tracer input
#  inputMass <- 10                        # input mass (g)
#  times <- c(0,30,60,600,1800,3600)      # times (seconds)
#  # End of settings ##############################################################
#  
#  # Load packages
#  library("deSolve")
#  library("rodeo")
#  
#  # Make sure that vector of times starts with zero
#  times <- sort(unique(c(0, times)))
#  
#  # Initialize rodeo object
#  rd <- function(f) {read.table(file=f,
#    header=TRUE, sep="\t", stringsAsFactors=FALSE) }
#  model <- rodeo$new(vars=rd("vars.txt"), pars=rd("pars.txt"),
#    funs=rd("funs.txt"), pros=rd("pros.txt"), stoi=rd("stoi.txt"),
#    asMatrix=FALSE, dim=c(nCells))
#  
#  # Numerical dispersion for backward finite-difference approx. of advection term
#  dNum <- u*dx/2
#  
#  # Assign initial values and parameters
#  model$setVars(cbind(
#    c=ifelse((1:nCells)==inputCell, inputMass/wetArea/dx, 0)
#  ))
#  model$setPars(cbind(
#    u=u, d=d-dNum, dx=dx,
#    leftmost= c(1, rep(0, nCells-1)),
#    rightmost= c(rep(0, nCells-1), 1)
#  ))
#  
#  # Generate code, compile into shared library, load library
#  model$compile(fileFun)
#  
#  # Numeric solution
#  solNum <- model$dynamics(times=times, jactype="bandint", bandup=1, banddown=1,
#    atol=1e-9)
#  
#  # Function providing the analytical solution
#  solAna <- function (x,t,mass,area,disp,velo) {
#    mass/area/sqrt(4*pi*disp*t) * exp(-((x-velo*t)^2) / (4*disp*t))
#  }
#  
#  # Graphically compare numerical and analytical solution
#  nc <- 2
#  nr <- ceiling(length(times) / nc)
#  layout(matrix(1:(nc*nr), ncol=nc, byrow=TRUE))
#  par(mar=c(4,4,1,1))
#  for (t in times) {
#    plot(c(0,nCells*dx), c(1e-7,inputMass/wetArea/dx), type="n", xlab="Station (m)",
#      ylab="g/m3", log="y")
#    # Numeric solution (stair steps of cell-average)
#    stations <- seq(from=0, by=dx, length.out=nCells+1)
#    concs <- solNum[solNum[,1]==t, paste0("c.",1:nCells)]
#    lines(stations, c(concs,concs[length(concs)]), type="s", col="steelblue4")
#    # Analytical solution (for center of cells)
#    stations <- seq(from=dx/2, to=(nCells*dx)-dx/2, by=dx)
#    concs <- solAna(x=stations, t=t, mass=inputMass, area=wetArea, disp=d, velo=u)
#    stations <- stations + (inputCell*dx) - dx/2
#    lines(stations, concs, col="red", lty=2)
#    # Extras
#    abline(v=(inputCell*dx) - dx/2, lty=3)
#    legend("topright", bty="n", paste("After",t,"sec"))
#    if (t == times[1]) legend("right",lty=1:2,
#      col=c("steelblue4","red"),legend=c("Numeric", "Exact"),bty="n")
#  }
#  layout(1)

## ----ref.label='advectionDispersion', echo=FALSE, eval=TRUE-----------------------------------------------------------
rm(list=ls())

# Adjustable settings ##########################################################
fileFun <- "functions.f95"
u <- 1                                 # advective velocity (m/s)
d <- 30                                # longit. dispersion coefficient (m2/s)
wetArea <- 50                          # wet cross-section area (m2)
dx <- 10                               # length of a sub-section (m)
nCells <- 1000                         # number of sub-sections
inputCell <- 100                       # index of sub-section with tracer input
inputMass <- 10                        # input mass (g)
times <- c(0,30,60,600,1800,3600)      # times (seconds)
# End of settings ##############################################################

# Load packages
library("deSolve")
library("rodeo")

# Make sure that vector of times starts with zero
times <- sort(unique(c(0, times)))

# Initialize rodeo object
rd <- function(f) {read.table(file=f,
  header=TRUE, sep="\t", stringsAsFactors=FALSE) }
model <- rodeo$new(vars=rd("vars.txt"), pars=rd("pars.txt"),
  funs=rd("funs.txt"), pros=rd("pros.txt"), stoi=rd("stoi.txt"),
  asMatrix=FALSE, dim=c(nCells))

# Numerical dispersion for backward finite-difference approx. of advection term
dNum <- u*dx/2

# Assign initial values and parameters
model$setVars(cbind(
  c=ifelse((1:nCells)==inputCell, inputMass/wetArea/dx, 0)
))
model$setPars(cbind(
  u=u, d=d-dNum, dx=dx,
  leftmost= c(1, rep(0, nCells-1)),
  rightmost= c(rep(0, nCells-1), 1)
))

# Generate code, compile into shared library, load library
model$compile(fileFun)              

# Numeric solution
solNum <- model$dynamics(times=times, jactype="bandint", bandup=1, banddown=1,
  atol=1e-9)

# Function providing the analytical solution
solAna <- function (x,t,mass,area,disp,velo) {
  mass/area/sqrt(4*pi*disp*t) * exp(-((x-velo*t)^2) / (4*disp*t))
}

# Graphically compare numerical and analytical solution
nc <- 2
nr <- ceiling(length(times) / nc)
layout(matrix(1:(nc*nr), ncol=nc, byrow=TRUE))
par(mar=c(4,4,1,1))
for (t in times) {
  plot(c(0,nCells*dx), c(1e-7,inputMass/wetArea/dx), type="n", xlab="Station (m)",
    ylab="g/m3", log="y")
  # Numeric solution (stair steps of cell-average)
  stations <- seq(from=0, by=dx, length.out=nCells+1)
  concs <- solNum[solNum[,1]==t, paste0("c.",1:nCells)]
  lines(stations, c(concs,concs[length(concs)]), type="s", col="steelblue4")
  # Analytical solution (for center of cells)
  stations <- seq(from=dx/2, to=(nCells*dx)-dx/2, by=dx)
  concs <- solAna(x=stations, t=t, mass=inputMass, area=wetArea, disp=d, velo=u)
  stations <- stations + (inputCell*dx) - dx/2
  lines(stations, concs, col="red", lty=2)
  # Extras
  abline(v=(inputCell*dx) - dx/2, lty=3)
  legend("topright", bty="n", paste("After",t,"sec"))
  if (t == times[1]) legend("right",lty=1:2,
    col=c("steelblue4","red"),legend=c("Numeric", "Exact"),bty="n")
}
layout(1)

## ---- cache=FALSE, echo=FALSE-----------------------------------------------------------------------------------------
# Reset work folder
knitr::opts_knit$set(root.dir=NULL)

## ---- cache=FALSE, echo=FALSE-----------------------------------------------------------------------------------------
# Set work folder
knitr::opts_knit$set(root.dir="examples/1D/groundwater")

## ---- echo=FALSE, results='asis', comment=''--------------------------------------------------------------------------
rd <- function(f) {read.table(f ,sep="\t", header=TRUE)}
knitr::kable(rd("vars.txt"), caption="Declaration of state variables (file 'vars.txt').")
knitr::kable(rd("pars.txt"), caption="Declaration of parameters (file 'pars.txt').")
knitr::kable(rd("funs.txt"), caption="Declaration of functions (file 'funs.txt').")
knitr::kable(rd("pros.txt"), caption="Definition of process rates (file 'pros.txt').")
knitr::kable(rd("stoi.txt"), caption="Definition of stoichiometric factors (file 'stoi.txt').")

## ----echo=FALSE, eval=TRUE, comment=''--------------------------------------------------------------------------------
f <- "functions.f95"
text <- readLines(f, n=-1L, ok=TRUE, warn=TRUE, encoding="unknown", skipNul=FALSE)
cat(paste(text,"\n"))

## ----cache=FALSE, echo=FALSE------------------------------------------------------------------------------------------
knitr::read_chunk("xecute.r")

## ----ref.label='groundwater', echo=TRUE, eval=FALSE-------------------------------------------------------------------
#  rm(list=ls())
#  
#  # Adjustable settings ##########################################################
#  fileFun <- "functions.f95"
#  dx <- 10                             # spatial discretization (m)
#  nx <- 100                            # number of boxes (-)
#  times <- seq(0, 12*365, 30)          # times of interest (days)
#  # End of settings ##############################################################
#  
#  # Load packages
#  library("deSolve")
#  library("rodeo")
#  
#  # Initialize model
#  rd <- function(f) {read.table(file=f,
#    header=TRUE, sep="\t", stringsAsFactors=FALSE)}
#  model <- rodeo$new(vars=rd("vars.txt"), pars=rd("pars.txt"),
#    funs=rd("funs.txt"), pros=rd("pros.txt"),
#    stoi=rd("stoi.txt"), asMatrix=FALSE, dim=nx)
#  
#  # Assign initial values and parameters
#  model$setVars(cbind( h=rep(11, nx) ))
#  model$setPars(cbind( dx=rep(dx, nx), kf=rep(5., nx), ne=rep(0.17, nx),
#    h0=rep(-10, nx), hBed=rep(10, nx), wBed=rep(0.5*dx, nx), kfBed=rep(5., nx),
#    tBed=rep(0.1, nx), leaky=c(1, rep(0, nx-1)) ))
#  
#  # Generate code, compile into shared library, load library
#  model$compile(fileFun)
#  
#  # Integrate
#  out <- model$dynamics(times=times, jactype="bandint", bandup=1, banddown=1)
#  
#  # Plot results
#  filled.contour(x=out[,"time"]/365.25, y=(1:nx)*dx-dx/2,
#    z=out[,names(model$getVars())], xlab="Years", ylab="Distance to river (m)",
#    color.palette=colorRampPalette(c("steelblue2","lightyellow","darkorange")),
#    key.title= mtext(side=3, "Ground water surf. (m)", padj=-0.5))

## ----ref.label='groundwater', echo=FALSE, eval=TRUE-------------------------------------------------------------------
rm(list=ls())

# Adjustable settings ##########################################################
fileFun <- "functions.f95"
dx <- 10                             # spatial discretization (m)
nx <- 100                            # number of boxes (-)                           
times <- seq(0, 12*365, 30)          # times of interest (days)
# End of settings ##############################################################

# Load packages
library("deSolve")
library("rodeo")

# Initialize model
rd <- function(f) {read.table(file=f,
  header=TRUE, sep="\t", stringsAsFactors=FALSE)}
model <- rodeo$new(vars=rd("vars.txt"), pars=rd("pars.txt"),
  funs=rd("funs.txt"), pros=rd("pros.txt"),
  stoi=rd("stoi.txt"), asMatrix=FALSE, dim=nx)

# Assign initial values and parameters
model$setVars(cbind( h=rep(11, nx) ))
model$setPars(cbind( dx=rep(dx, nx), kf=rep(5., nx), ne=rep(0.17, nx),
  h0=rep(-10, nx), hBed=rep(10, nx), wBed=rep(0.5*dx, nx), kfBed=rep(5., nx),
  tBed=rep(0.1, nx), leaky=c(1, rep(0, nx-1)) ))

# Generate code, compile into shared library, load library
model$compile(fileFun)              

# Integrate
out <- model$dynamics(times=times, jactype="bandint", bandup=1, banddown=1)

# Plot results
filled.contour(x=out[,"time"]/365.25, y=(1:nx)*dx-dx/2,
  z=out[,names(model$getVars())], xlab="Years", ylab="Distance to river (m)",
  color.palette=colorRampPalette(c("steelblue2","lightyellow","darkorange")),
  key.title= mtext(side=3, "Ground water surf. (m)", padj=-0.5))

## ---- cache=FALSE, echo=FALSE-----------------------------------------------------------------------------------------
# Reset work folder
knitr::opts_knit$set(root.dir=NULL)

## ---- cache=FALSE, echo=FALSE-----------------------------------------------------------------------------------------
# Set work folder
knitr::opts_knit$set(root.dir="examples/1D/tetracycline")

## ---- echo=FALSE, results='asis', comment=''--------------------------------------------------------------------------
rd <- function(f) {read.table(f ,sep="\t", header=TRUE)}
knitr::kable(rd("vars.txt"), caption="Declaration of state variables (file 'vars.txt').")

## ---- echo=FALSE, results='asis', comment=''--------------------------------------------------------------------------
x <- read.table("pros.txt" ,sep="\t", header=TRUE)
capt <- "Definition of process rates (file 'pros.txt')"
if (getOption("vignetteDocumentFormat") == "rmarkdown::pdf_document") {
  x <- cbind(id=1:nrow(x), x)
  print(xtable::xtable(x[,c("id", "name","unit","description")],
    caption=paste0(capt, "; first columns.")),
    type="latex", tabular.environment="longtable", floating=FALSE)
  print(xtable::xtable(x[,c("id","expression")],
    caption=paste0(capt, "; further columns."),
    align=c("l","l","p{15cm}")),
    type="latex", tabular.environment="longtable", floating=FALSE)
} else if (getOption("vignetteDocumentFormat") == "rmarkdown::html_document") {
  knitr::kable(x, caption=paste0(capt,"."))
} else {
  stop("cannot figure out output document format for custom table formatting")
}


## ---- echo=FALSE, results='asis', comment=''--------------------------------------------------------------------------
x <- read.table("stoi.txt" ,sep="\t", header=TRUE)
capt <- "Stoichiometric factors (file 'stoi.txt')"
if (getOption("vignetteDocumentFormat") == "rmarkdown::pdf_document") {
  col <- 1 + round((ncol(x)-1)/2)
  print(xtable::xtable(x[,c(1, 2:col)],
    caption=paste0(capt, "; first columns.")),
    type="latex", tabular.environment="longtable", floating=FALSE)
  print(xtable::xtable(x[,c(1,(col+1):ncol(x))],
    caption=paste0(capt, "; further columns.")),
    type="latex", tabular.environment="longtable", floating=FALSE)
} else if (getOption("vignetteDocumentFormat") == "rmarkdown::html_document") {
  knitr::kable(x, caption=paste0(capt,"."))
} else {
  stop("cannot figure out output document format for custom table formatting")
}

## ---- echo=FALSE, results='asis', comment=''--------------------------------------------------------------------------
rd <- function(f) {read.table(f ,sep="\t", header=TRUE)}
knitr::kable(rd("pars.txt"), caption="Declaration of parameters (file 'pars.txt').")
knitr::kable(rd("funs.txt"), caption="Declaration of functions (file 'funs.txt').")

## ----echo=FALSE, eval=TRUE, comment=''--------------------------------------------------------------------------------
f <- "functions.f95"
text <- readLines(f, n=-1L, ok=TRUE, warn=TRUE, encoding="unknown", skipNul=FALSE)
cat(paste(text,"\n"))

## ----cache=FALSE, echo=FALSE------------------------------------------------------------------------------------------
knitr::read_chunk("xecute.r")

## ----ref.label='tetracycline_init', echo=TRUE, eval=TRUE--------------------------------------------------------------
# Adjustable settings ##########################################################

# Properties of the reach not being parameters of the core model
len <-   125000             # reach length (m)
uL  <- 0.5 * 86400          # flow velocity (m/d)
dL  <- 300 * 86400          # longitudinal dispersion coefficient (m2/d)
xsArea <- 0.6 * 15          # wet cross-section area (m2)

# End of settings ##############################################################

# Computational parameters
nTanks <- trunc(uL * len / dL / 2) + 1 # number of tanks; see Elgeti (1996)
dt_max <- 0.5 * len / nTanks / uL      # max. time step (d); Courant criterion

# Load packages
library("rodeo")
library("deSolve")
library("rootSolve")

# Initialize rodeo object
rd <- function(f, ...) { read.table(file=f, header=TRUE, sep="\t", ...) }
model <- rodeo$new(vars=rd("vars.txt"), pars=rd("pars.txt"), funs=rd("funs.txt"),
  pros=rd("pros.txt"), stoi=as.matrix(rd("stoi.txt", row.names="process")),
  asMatrix=TRUE, dim=c(nTanks))

# Generate code, compile into shared library, load library
model$compile(sources="functions.f95")

# Assign initial values
vars <- matrix(rep(as.numeric(model$getVarsTable()$initial), each=nTanks),
  ncol=model$lenVars(), nrow=nTanks, dimnames=list(NULL, model$namesVars()))
model$setVars(vars)

# Assign / update values of parameters; River flow is assumed to be steady
# and uniform (i.e. constant in space and time); Settling and resuspension
# velocities are computed from steady-state mass balance as in Hellweger (2011)
pars <- matrix(
  rep(suppressWarnings(as.numeric(model$getParsTable()$default)), each=nTanks),
  ncol=model$lenPars(), nrow=nTanks, dimnames=list(NULL, model$namesPars()))
pars[,"V"] <- xsArea * len/nTanks                           # tank volumes
pars[,"Q"] <- c(0, rep(uL * xsArea, nTanks-1))              # inflow from upstr.
pars[,"Q_in"] <- c(uL * xsArea, rep(0, nTanks-1))           # inflow to tank 1
pars[,"us"] <- pars[,"kh_s"] * pars[,"ds"] /                # settling velocity
  ((vars[,"POM_w"] / vars[,"POM_s"]) -
  (vars[,"TSS_w"] / vars[,"TSS_s"]))
pars[,"ur"] <- pars[,"us"] * vars[,"TSS_w"] /               # resuspension velo.
  vars[,"TSS_s"]
model$setPars(pars)

## ----ref.label='tetracycline_stoi', echo=TRUE, eval=FALSE-------------------------------------------------------------
#  # Plot stoichiometry matrix using symbols
#  m <- model$stoichiometry(box=1)
#  clr <- function(x, ignoreSign=FALSE) {
#    res <- rep("transparent", length(x))
#    if (ignoreSign) {
#      res[x != 0] <- "black"
#    } else {
#      res[x < 0] <- "lightgrey"
#      res[x > 0] <- "white"
#    }
#    return(res)
#  }
#  sym <- function(x, ignoreSign=FALSE) {
#    res <- rep(NA, length(x))
#    if (ignoreSign) {
#      res[x != 0] <- 21
#    } else {
#      res[x < 0] <- 25
#      res[x > 0] <- 24
#    }
#    return(res)
#  }
#  omar <- par("mar")
#  par(mar=c(1,6,6,1))
#  plot(c(1,ncol(m)), c(1,nrow(m)), bty="n", type="n", xaxt="n", yaxt="n",
#    xlab="", ylab="")
#  abline(h=1:nrow(m), v=1:ncol(m), col="grey")
#  for (ir in 1:nrow(m)) {
#    ignoreSign <- grepl(pattern="^transport.*", x=rownames(m)[ir]) ||
#      grepl(pattern="^diffusion.*", x=rownames(m)[ir])
#    points(1:ncol(m), rep(ir,ncol(m)), pch=sym(m[ir,1:ncol(m)], ignoreSign),
#      bg=clr(m[ir,1:ncol(m)], ignoreSign))
#  }
#  mtext(side=2, at=1:nrow(m), rownames(m), las=2, line=0.5, cex=0.8)
#  mtext(side=3, at=1:ncol(m), colnames(m), las=2, line=0.5, cex=0.8)
#  par(mar=omar)
#  rm(m)

## ----ref.label='tetracycline_stoi', echo=FALSE, eval=TRUE, fig.width=6, fig.height=7----------------------------------
# Plot stoichiometry matrix using symbols
m <- model$stoichiometry(box=1)
clr <- function(x, ignoreSign=FALSE) {
  res <- rep("transparent", length(x))
  if (ignoreSign) {
    res[x != 0] <- "black"
  } else {
    res[x < 0] <- "lightgrey"
    res[x > 0] <- "white"
  }
  return(res)
}
sym <- function(x, ignoreSign=FALSE) {
  res <- rep(NA, length(x))
  if (ignoreSign) {
    res[x != 0] <- 21
  } else {
    res[x < 0] <- 25
    res[x > 0] <- 24
  }
  return(res)
}
omar <- par("mar")
par(mar=c(1,6,6,1))
plot(c(1,ncol(m)), c(1,nrow(m)), bty="n", type="n", xaxt="n", yaxt="n",
  xlab="", ylab="")
abline(h=1:nrow(m), v=1:ncol(m), col="grey")
for (ir in 1:nrow(m)) {
  ignoreSign <- grepl(pattern="^transport.*", x=rownames(m)[ir]) ||
    grepl(pattern="^diffusion.*", x=rownames(m)[ir])
  points(1:ncol(m), rep(ir,ncol(m)), pch=sym(m[ir,1:ncol(m)], ignoreSign),
    bg=clr(m[ir,1:ncol(m)], ignoreSign))
}
mtext(side=2, at=1:nrow(m), rownames(m), las=2, line=0.5, cex=0.8)
mtext(side=3, at=1:ncol(m), colnames(m), las=2, line=0.5, cex=0.8)
par(mar=omar)
rm(m)

## ----ref.label='tetracycline_steady', echo=TRUE, eval=FALSE-----------------------------------------------------------
#  # Estimate steady-state
#  std <- rootSolve::steady.1D(y=model$getVars(), time=NULL, func=model$libFunc(),
#    parms=model$getPars(), nspec=model$lenVars(), dimens=nTanks, positive=TRUE,
#    dllname=model$libName(), nout=model$lenPros()*nTanks)
#  if (!attr(std, which="steady", exact=TRUE))
#    stop("Steady-state run failed.")
#  names(std$y) <- names(model$getVars())
#  
#  # Plot bacterial densities
#  stations= ((1:nTanks) * len/nTanks - len/nTanks/2) / 1000     # stations (km)
#  domains= c(Water="_w", Sediment="_s")                         # domain suffixes
#  layout(matrix(1:length(domains), ncol=length(domains)))
#  for (i in 1:length(domains)) {
#    R= match(paste0("R",domains[i],".",1:nTanks), names(std$y)) # resistant bac.
#    S= match(paste0("S",domains[i],".",1:nTanks), names(std$y)) # susceptibles
#    plot(x=range(stations), y=range(std$y[c(S,R)]), type="n",
#      xlab=ifelse(i==1,"Station (km)",""), ylab=ifelse(i==1,"mg/l",""))
#    lines(stations, std$y[R], lty=1)
#    lines(stations, std$y[S], lty=2)
#    if (i==1) legend("topleft", bty="n", lty=1:2, legend=c("Resistant","Suscept."))
#    mtext(side=3, names(domains)[i])
#  }

## ----ref.label='tetracycline_steady', echo=FALSE, eval=TRUE, fig.width=6, fig.height=3.5------------------------------
# Estimate steady-state
std <- rootSolve::steady.1D(y=model$getVars(), time=NULL, func=model$libFunc(),
  parms=model$getPars(), nspec=model$lenVars(), dimens=nTanks, positive=TRUE,
  dllname=model$libName(), nout=model$lenPros()*nTanks)
if (!attr(std, which="steady", exact=TRUE))
  stop("Steady-state run failed.")
names(std$y) <- names(model$getVars())

# Plot bacterial densities
stations= ((1:nTanks) * len/nTanks - len/nTanks/2) / 1000     # stations (km)
domains= c(Water="_w", Sediment="_s")                         # domain suffixes
layout(matrix(1:length(domains), ncol=length(domains)))
for (i in 1:length(domains)) {
  R= match(paste0("R",domains[i],".",1:nTanks), names(std$y)) # resistant bac.
  S= match(paste0("S",domains[i],".",1:nTanks), names(std$y)) # susceptibles
  plot(x=range(stations), y=range(std$y[c(S,R)]), type="n",
    xlab=ifelse(i==1,"Station (km)",""), ylab=ifelse(i==1,"mg/l",""))
  lines(stations, std$y[R], lty=1)
  lines(stations, std$y[S], lty=2)
  if (i==1) legend("topleft", bty="n", lty=1:2, legend=c("Resistant","Suscept."))
  mtext(side=3, names(domains)[i])
}

## ----ref.label='tetracycline_dynamic', echo=TRUE, eval=TRUE, fig.width=6, fig.height=3.5------------------------------
# Dynamic simulation
times <- seq(0, 7, 1/48)                              # requested output times
dyn <- deSolve::ode(y=model$getVars(), times=times, func=model$libFunc(),
  parms=model$getPars(), NLVL=nTanks, dllname=model$libName(),
  hmax=dt_max, nout=model$lenPros()*nTanks,
  jactype="bandint", bandup=1, banddown=1)
if (attr(dyn, which="istate", exact=TRUE)[1] != 2)
  stop("Dynamic run failed.")

# Plot dynamic solution
stations= (1:nTanks) * len/nTanks - len/nTanks/2
name <- "S_w"
m <- dyn[ ,match(paste0(name,".",1:nTanks), colnames(dyn))]
filled.contour(x=stations, y=dyn[,"time"], z=t(m), xlab="Station", ylab="Days",
  color.palette=colorRampPalette(c("lightskyblue3","khaki","peru")),
  main=name, cex.main=1, font.main=1)

## ----ref.label='tetracycline_sensitivity', echo=TRUE, eval=FALSE------------------------------------------------------
#  # Define parameter values for sensitivity analysis
#  testList <- list(
#    A_in= c(0.002, 0.005),                              #   input of antibiotic
#    alpha= c(0, 0.25),                                  #   cost of resistance
#    ks= seq(0, 0.02, 0.002),                            #   loss of resistance
#    kc= 10^seq(from=-4, to=-2, by=0.5))                 #   transfer of resistance
#  
#  # Set up parameter sets
#  testSets <- expand.grid(testList)
#  
#  # Function to return the steady-state solution for specific parameters
#  f <- function(set, y0) {
#    p <- model$getPars(asArray=TRUE)
#    p[,names(set)] <- rep(as.numeric(set), each=nTanks) # update parameters
#    out <- rootSolve::steady.1D(y=y0, time=NULL, func=model$libFunc(),
#      parms=p, nspec=model$lenVars(), dimens=nTanks, positive=TRUE,
#      dllname=model$libName(), nout=model$lenPros()*nTanks)
#    if (attr(out, which="steady", exact=TRUE)) {        # solution found?
#      names(out$y) <- names(model$getVars())
#      down_S_w <- out$y[paste0("S_w",".",nTanks)]       # bacteria concentrations
#      down_R_w <- out$y[paste0("R_w",".",nTanks)]       #   at lower end of reach
#      return(unname(down_R_w / (down_R_w + down_S_w)))  # fraction of resistant b.
#    } else {
#      return(NA)                                        # if solver failed
#    }
#  }
#  
#  # Use already computed steady state solution as initial guess
#  y0 <- array(std$y, dim=c(nTanks, model$lenVars()),
#    dimnames=list(NULL, model$namesVars()))
#  
#  # Apply model to all sets and store results as 4-dimensional array
#  res <- array(apply(X=testSets, MARGIN=1, FUN=f, y0=y0),
#    dim=lapply(testList, length), dimnames=testList)
#  
#  # Plot results of the analysis
#  omar <- par("mar")
#  par(mar=c(4,4,1.5,1))
#  breaks <- pretty(res, 8)
#  colors <- colorRampPalette(c("steelblue2","khaki2","brown"))(length(breaks)-1)
#  nr <- length(testList$A_in)
#  nc <- length(testList$alpha)
#  layout(cbind(matrix(1:(nr*nc), nrow=nr), rep(nr*nc+1, nr)))
#  for (alpha in testList$alpha) {
#    for (A_in in testList$A_in) {
#      labs <- (A_in == tail(testList$A_in, n=1)) && (alpha == testList$alpha[1])
#      image(x=log10(as.numeric(dimnames(res)$kc)), y=as.numeric(dimnames(res)$ks),
#        z=t(res[as.character(A_in), as.character(alpha),,]),
#        zlim=range(res), breaks=breaks, col=colors,
#        xlab=ifelse(labs, "log10(kc)", ""), ylab=ifelse(labs, "ks", ""))
#      if (A_in == testList$A_in[1])
#        mtext(side=3, paste0("alpha = ",alpha), cex=par("cex"), line=.2)
#      if (alpha == tail(testList$alpha, n=1))
#        mtext(side=4, paste0("A_in = ",A_in), cex=par("cex"), las=3, line=.2)
#    }
#  }
#  plot.new()
#  legend("left", bty="n", title="% resistant", fill=colors,
#    legend=paste0(breaks[-length(breaks)]*100," - ", breaks[-1]*100))
#  layout(1)
#  par(mar=omar)

## ----ref.label='tetracycline_sensitivity', echo=FALSE, eval=TRUE, fig.width=7, fig.height=4---------------------------
# Define parameter values for sensitivity analysis
testList <- list(
  A_in= c(0.002, 0.005),                              #   input of antibiotic
  alpha= c(0, 0.25),                                  #   cost of resistance
  ks= seq(0, 0.02, 0.002),                            #   loss of resistance
  kc= 10^seq(from=-4, to=-2, by=0.5))                 #   transfer of resistance

# Set up parameter sets
testSets <- expand.grid(testList)

# Function to return the steady-state solution for specific parameters
f <- function(set, y0) {
  p <- model$getPars(asArray=TRUE)  
  p[,names(set)] <- rep(as.numeric(set), each=nTanks) # update parameters
  out <- rootSolve::steady.1D(y=y0, time=NULL, func=model$libFunc(),
    parms=p, nspec=model$lenVars(), dimens=nTanks, positive=TRUE,
    dllname=model$libName(), nout=model$lenPros()*nTanks)
  if (attr(out, which="steady", exact=TRUE)) {        # solution found?
    names(out$y) <- names(model$getVars())
    down_S_w <- out$y[paste0("S_w",".",nTanks)]       # bacteria concentrations
    down_R_w <- out$y[paste0("R_w",".",nTanks)]       #   at lower end of reach
    return(unname(down_R_w / (down_R_w + down_S_w)))  # fraction of resistant b.
  } else {
    return(NA)                                        # if solver failed
  }
}

# Use already computed steady state solution as initial guess
y0 <- array(std$y, dim=c(nTanks, model$lenVars()),
  dimnames=list(NULL, model$namesVars()))

# Apply model to all sets and store results as 4-dimensional array
res <- array(apply(X=testSets, MARGIN=1, FUN=f, y0=y0),
  dim=lapply(testList, length), dimnames=testList)

# Plot results of the analysis
omar <- par("mar")
par(mar=c(4,4,1.5,1))
breaks <- pretty(res, 8)
colors <- colorRampPalette(c("steelblue2","khaki2","brown"))(length(breaks)-1)
nr <- length(testList$A_in)
nc <- length(testList$alpha)
layout(cbind(matrix(1:(nr*nc), nrow=nr), rep(nr*nc+1, nr)))
for (alpha in testList$alpha) {
  for (A_in in testList$A_in) {
    labs <- (A_in == tail(testList$A_in, n=1)) && (alpha == testList$alpha[1])
    image(x=log10(as.numeric(dimnames(res)$kc)), y=as.numeric(dimnames(res)$ks),
      z=t(res[as.character(A_in), as.character(alpha),,]),
      zlim=range(res), breaks=breaks, col=colors,
      xlab=ifelse(labs, "log10(kc)", ""), ylab=ifelse(labs, "ks", ""))
    if (A_in == testList$A_in[1])
      mtext(side=3, paste0("alpha = ",alpha), cex=par("cex"), line=.2)
    if (alpha == tail(testList$alpha, n=1))
      mtext(side=4, paste0("A_in = ",A_in), cex=par("cex"), las=3, line=.2)
  }
}
plot.new()
legend("left", bty="n", title="% resistant", fill=colors,
  legend=paste0(breaks[-length(breaks)]*100," - ", breaks[-1]*100))
layout(1)
par(mar=omar)

## ---- cache=FALSE, echo=FALSE-----------------------------------------------------------------------------------------
# Reset work folder
knitr::opts_knit$set(root.dir=NULL)

## ---- cache=FALSE, echo=FALSE-----------------------------------------------------------------------------------------
# Set work folder
knitr::opts_knit$set(root.dir="examples/linked/waterSediment")

## ----echo=FALSE-------------------------------------------------------------------------------------------------------
x <- rbind(
 c("sett", "sed", "flux_x", "wat", "sett", "process rate"),
 c("diff", "sed", "xWat", "wat", "xWat", "state variable"),
 c("diff", "wat", "flux_s", "sed", "diff", "process rate")
)
colnames(x) <- c("Link process", "Target obj.", "Target param.", "Source obj.", "Source item", "Source type")
knitr::kable(as.data.frame(x))

## ---- echo=FALSE, results='asis', comment=''--------------------------------------------------------------------------
rd <- function(f) {read.table(paste0("singleObject/",f) ,sep="\t", header=TRUE)}
knitr::kable(rd("vars.txt"), caption="Declaration of state variables (file 'vars.txt').")
knitr::kable(rd("pars.txt"), caption="Declaration of parameters (file 'pars.txt').")
knitr::kable(rd("funs.txt"), caption="Declaration of functions (file 'funs.txt').")
knitr::kable(rd("pros.txt"), caption="Definition of process rates (file 'pros.txt').")
knitr::kable(rd("stoi.txt"), caption="Definition of stoichiometric factors (file 'stoi.txt').")

## ----echo=FALSE, eval=TRUE, comment=''--------------------------------------------------------------------------------
f <- "functions.f95"
text <- readLines(f, n=-1L, ok=TRUE, warn=TRUE, encoding="unknown", skipNul=FALSE)
cat(paste(text,"\n"))

## ----cache=FALSE, echo=FALSE------------------------------------------------------------------------------------------
knitr::read_chunk("xecute_singleObject.r")

## ----ref.label='singleObjectVersion', echo=TRUE, eval=TRUE, fig.height=6----------------------------------------------
rm(list=ls())

# Adjustable settings ##########################################################
times <- seq(from=0, to=2*365, by=1)                         # Times of interest
pars <- c(kWat=0.1, kSed=0.02, kDif=1e-9*86400, hDif=0.05,   # Parameters
  por=0.9, uSet=0.5, zWat=5, zSed=0.1, vol=10e6, s_x=1/106)
vars <- c(xWat=0, xSed=0, sWat=0, sSed=0)                    # Initial values
# End of settings ##############################################################

# Load packages
library("rodeo")
library("deSolve")

# Initialize rodeo object
rd <- function(f, ...) {read.table(file=paste0("singleObject/",f),
  sep="\t", header=TRUE, ...)}
model <- rodeo$new(
  vars=rd("vars.txt"), pars=rd("pars.txt"), funs=rd("funs.txt"), pros=rd("pros.txt"),
  stoi=as.matrix(rd("stoi.txt", row.names="process")), asMatrix=TRUE, dim=1)

# Assign initial values and parameters
model$setVars(vars)
model$setPars(pars)

# Generate code, compile into shared library, load library
model$compile("functions.f95")              

# Integrate
out <- model$dynamics(times=times)

# Plot method for deSolve objects
plot(out)

## ---- echo=FALSE, results='asis', comment=''--------------------------------------------------------------------------
rd <- function(f) {read.table(paste0("multiObject/",f) ,sep="\t", header=TRUE)}
obj <- c(wat="water column", sed="sediment")

for (i in 1:length(obj))
  print(knitr::kable(rd(paste0(names(obj[i]),"_vars.txt")),
    caption=paste0("State variables of the ",obj[i]," object (file '",names(obj)[i],"_vars.txt').")))
for (i in 1:length(obj))
  print(knitr::kable(rd(paste0(names(obj[i]),"_pars.txt")),
    caption=paste0("Parameters of the ",obj[i]," object (file '",names(obj)[i],"_pars.txt').")))
for (i in 1:length(obj))
  print(knitr::kable(rd(paste0(names(obj[i]),"_funs.txt")),
    caption=paste0("Functions of the ",obj[i]," object (file '",names(obj)[i],"_funs.txt').")))
for (i in 1:length(obj))
  print(knitr::kable(rd(paste0(names(obj[i]),"_pros.txt")),
    caption=paste0("Processes of the ",obj[i]," object (file '",names(obj)[i],"_pros.txt').")))
for (i in 1:length(obj))
  print(knitr::kable(rd(paste0(names(obj[i]),"_stoi.txt")),
    caption=paste0("Stoichiometry of the ",obj[i]," object (file '",names(obj)[i],"stoi.txt').")))

## ----cache=FALSE, echo=FALSE------------------------------------------------------------------------------------------
knitr::read_chunk("xecute_multiObject.r")

## ----ref.label='multiObjectVersion', echo=TRUE, eval=TRUE, results='hold', fig.height=8-------------------------------
rm(list=ls())

# Adjustable settings ##########################################################
internal <- TRUE                       # Use internal solver instead of deSolve?
times <- seq(from=0, to=365*2, by=1)   # Times of interest
objects <- c("wat", "sed")             # Object names
pars <- list(                          # Fixed parameters
  wat= c(kWat=0.1, uSet=0.5, zWat=5, vol=10e6, s_x=1/106),
  sed= c(kSed=0.02, kDif=1e-9*86400, hDif=0.05, por=0.9, zSed=0.1, s_x=1/106)
)
vars <- list(                          # Initial values
  wat= c(xWat=0, sWat=0),
  sed= c(xSed=0, sSed=0)
)

# Parameters used for model coupling; these need to be initialized
pars$wat["flux_s"] <- 0
pars$sed["flux_x"] <- 0
pars$sed["sWat"] <- vars$w["sWat"]

# Definition of links between objects
# The value for a parameter in a target object (needs data) is provided by a
# source object (supplier). Supplied is either a state variable or process rate.
links <- rbind(
  link1= c(tarObj="wat", tarPar="flux_s", srcObj="sed", srcItem="diff"),
  link2= c(tarObj="sed", tarPar="flux_x", srcObj="wat", srcItem="sett"),
  link3= c(tarObj="sed", tarPar="sWat",   srcObj="wat", srcItem="sWat")
)
# End of settings ##############################################################

# Load packages
library("rodeo")
library("deSolve")

# Create list of rodeo objects
rd <- function(dir,f, ...) {read.table(file=paste0("multiObject/",obj,"_",f),
  sep="\t", header=TRUE, ...)}
models <- list()
for (obj in objects) {
  models[[obj]] <- rodeo$new(
    vars=rd(obj, "vars.txt"), pars=rd(obj, "pars.txt"),
    funs=rd(obj, "funs.txt"), pros=rd(obj, "pros.txt"),
    stoi=as.matrix(rd(obj, "stoi.txt", row.names="process")), asMatrix=TRUE,
    dim=1)
}

# Generate and load Fortran library for selected integrator
if (internal) {
  for (obj in objects)
    models[[obj]]$initStepper("functions.f95", method="rk5")
} else {
  for (obj in objects) {
    models[[obj]]$compile("functions.f95")
  }
}

# Set initial parameters and initial values
invisible(lapply(objects, function(obj) {models[[obj]]$setVars(vars[[obj]])}))
invisible(lapply(objects, function(obj) {models[[obj]]$setPars(pars[[obj]])}))

# Function to update parameters of a particular object using the linkage table
# Inputs: 
#   objPar: Parameters of a particular target object (numeric vector)
#   src:    States and process rates of all objects (list of numeric vectors)
#   links:  Object linkage table (matrix of type character)
# Returns:  objPar after updating of values
updatePars <- function (objPar, src, links) {
  if (nrow(links) > 0) {
    f <- function(i) {
      objPar[links[i,"tarPar"]] <<- src[[links[i,"srcObj"]]][links[i,"srcItem"]]
      NULL
    }
    lapply(1:nrow(links), f)
  }
  objPar
}

# Wrapper for integration methods
integr <- function(obj, t0, t1, models, internal, check) {
  if (internal) {
    return(models[[obj]]$step(t0, h=t1-t0, check=check))
  } else {
    return(models[[obj]]$dynamics(times=c(t0, t1))[2,-1])
  }
}

# Simulate coupled models over a single time step
advance <- function(i, times, objects, models, internal) {
  # Call integrator
  out <- sapply(objects, integr, t0=times[i], t1=times[i+1], models=models,
    internal=internal, check=(i==1), simplify=FALSE)
  # Update parameters affected by coupling
  lapply(objects, function(obj)
    {models[[obj]]$setPars(
    updatePars(models[[obj]]$getPars(useNames=TRUE), out,
      links[links[,"tarObj"]==obj,,drop=FALSE]))})
  # Re-initialize state variables 
  lapply(objects, function(obj)
    {models[[obj]]$setVars(out[[obj]][models[[obj]]$namesVars()])})
  # Return all outputs in a single vector
  unlist(out)
}

# Solve for all time steps
system.time({
  out <- t(sapply(1:(length(times)-1), advance, times=times, objects=objects,
    models=models, internal=internal))
})

# Plot
out <- cbind(time= times[2:length(times)], out)
class(out) <- "deSolve"
plot(out, mfrow=c(4,3))

## ---- cache=FALSE, echo=FALSE-----------------------------------------------------------------------------------------
# Reset work folder
knitr::opts_knit$set(root.dir=NULL)

