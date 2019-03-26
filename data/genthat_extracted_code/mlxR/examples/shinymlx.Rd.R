library(mlxR)


### Name: shinymlx
### Title: Automatic code generation for Shiny applications
### Aliases: shinymlx

### ** Examples

## Not run: 
##D library(mlxR)
##D PKPDmodel <- inlineModel("
##D [LONGITUDINAL] 
##D input={ka,V,Cl,Imax,IC50,S0,kout}
##D EQUATION:
##D C     = pkmodel(ka, V, Cl)
##D E_0   = S0 
##D ddt_E = kout*((1-Imax*C/(C+IC50))*S0- E)  
##D ")
##D 
##D p1  <- c(ka=0.5, V=10, Cl=1)
##D p2  <- c(Imax=0.5, IC50=0.03, S0=100, kout=0.1)
##D adm <- list(tfd=5, nd=15, ii=12, amount=1)
##D f1  <- list(name = 'C', time = seq(0, 250, by=1))
##D f2  <- list(name = 'E', time = seq(0, 250, by=1))
##D f   <- list(f1, f2)
##D 
##D shinymlx(model=PKPDmodel, treatment=adm, parameter=list(p1,p2), output=f,
##D          style="dashboard1")
##D 
##D #------------------------------------------------------------------------
##D p1 <- list(
##D   ka    = list(widget="slider", value=0.5, min=0.1, max=2,  step=0.1),
##D   V     = list(widget="slider", value=10,  min=2,   max=20, step=2),
##D   Cl    = list(widget="slider", value=1,   min=0.1, max=2,  step=0.1)
##D )  
##D adm <- list(
##D   tfd    = list(widget="slider", value=5,  min=0, max=100, step=5),
##D   nd     = list(widget="numeric", value=15),
##D   ii     = list(widget="select", selected=12, choices=c(3,6,12,18,24)),
##D   amount = list(widget="slider", value=40, min=0, max=50, step=5)
##D )
##D s <- list(select.x=FALSE, select.y=FALSE)
##D shinymlx(model=PKPDmodel, treatment=adm, parameter=list(p1,p2), output=f, 
##D          style="navbar1", settings=s)
## End(Not run)



