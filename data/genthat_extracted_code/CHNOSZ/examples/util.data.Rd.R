library(CHNOSZ)


### Name: util.data
### Title: Functions for Checking Thermodynamic Data
### Aliases: util.data thermo.refs checkEOS checkGHS check.obigt RH2obigt

### ** Examples
## Don't show: 
data(thermo)
## End(Don't show)
# citation information for Helgeson et al., 1998
thermo.refs("HOK+98")
# two references for alanine
thermo.refs(info("alanine"))
# three references for species in the reaction
s <- subcrt(c("O2","O2"),c("gas","aq"),c(-1,1))
thermo.refs(s) 
## Not run: 
##D ## marked dontrun because it opens a browser
##D # show the contents of thermo$refs
##D thermo.refs()
## End(Not run) 

## calculate thermodynamic properties of organic compounds
## using group additivity, after Richard and Helgeson, 1998
RH2obigt()



