library(psidR)


### Name: build.panel
### Title: build.panel: Build PSID panel data set
### Aliases: build.panel

### ** Examples

## Not run: 
##D # ################################################
##D # Real-world example: not run because takes long.
##D # Build panel with income, wage, age and education
##D # optionally: add wealth supplements!
##D # ################################################
##D 
##D # The package is installed with a list of variables
##D # Alternatively, search for names with \code{getNamesPSID}
##D # This is the body of function build.psid()
##D # (so why not call build.psid() and see what happens!)
##D r = system.file(package="psidR")
##D if (small){
##D   f = fread(file.path(r,"psid-lists","famvars-small.txt"))
##D   i = fread(file.path(r,"psid-lists","indvars-small.txt"))
##D   if (wealth){
##D     w = fread(file.path(r,"psid-lists","wealthvars-small.txt"))
##D   }
##D } else {
##D   f = fread(file.path(r,"psid-lists","famvars.txt"))
##D   i = fread(file.path(r,"psid-lists","indvars.txt"))
##D   if (wealth){
##D     w = fread(file.path(r,"psid-lists","wealthvars.txt"))
##D   }
##D }
##D setkey(i,"name")
##D setkey(f,"name")
##D if (wealth) setkey(w,"name")
##D i = dcast(i[,list(year,name,variable)],year~name)
##D f = dcast(f[,list(year,name,variable)],year~name)
##D if (wealth) {
##D   w = dcast(w[,list(year,name,variable)],year~name)
##D   d = build.panel(datadir="~/datasets/psid/",fam.vars=f,
##D                  ind.vars=i,wealth.vars=w, 
##D                  heads.only =TRUE,sample="SRC",
##D                  design="all")
##D   save(d,file="~/psid_wealth.RData")
##D } else {
##D   d = build.panel(datadir="~/datasets/psid/",fam.vars=f,
##D                  ind.vars=i, 
##D                  heads.only =TRUE,sample="SRC",
##D                  design="all")
##D   save(d,file="~/psid_no_wealth.RData")
##D }
## End(Not run)

# ######################################
# reproducible example on artifical data. 
# run this with example(build.panel).
# ######################################

## make reproducible family data sets for 2 years
## variables are: family income (Money) and age

## Data acquisition step:
## run build.panel with sascii=TRUE

# testPSID creates artifical PSID data
td <- testPSID(N=12,N.attr=0)
fam1985 <- data.table::copy(td$famvars1985)
fam1986 <- data.table::copy(td$famvars1986)
IND2009ER <- data.table::copy(td$IND2009ER)

# create a temporary datadir
my.dir <- tempdir()
#save those in the datadir
# notice different R formats admissible
save(fam1985,file=paste0(my.dir,"/FAM1985ER.rda"))
save(fam1986,file=paste0(my.dir,"/FAM1986ER.RData"))
save(IND2009ER,file=paste0(my.dir,"/IND2009ER.RData"))

## end Data acquisition step.

# now define which famvars
famvars <- data.frame(year=c(1985,1986),
                      money=c("Money85","Money86"),
                      age=c("age85","age86"))

# create ind.vars
indvars <- data.frame(year=c(1985,1986),ind.weight=c("ER30497","ER30534"))

# call the builder
# data will contain column "relation.head" holding the relationship code.

d <- build.panel(datadir=my.dir,fam.vars=famvars,
                 ind.vars=indvars,
                 heads.only=FALSE)	

# see what happens if we drop non-heads
# only the ones who are heads in BOTH years 
# are present (since design='balanced' by default)
d <- build.panel(datadir=my.dir,fam.vars=famvars,
                 ind.vars=indvars,
                 heads.only=TRUE)	
print(d[order(pid)],nrow=Inf)

# change sample design to "all": 
# we'll keep individuals if they are head in one year,
# and drop in the other
d <- build.panel(datadir=my.dir,fam.vars=famvars,
                 ind.vars=indvars,heads.only=TRUE,
                 design="all")	
print(d[order(pid)],nrow=Inf)

file.remove(paste0(my.dir,"/FAM1985ER.rda"),
            paste0(my.dir,"/FAM1986ER.RData"),
            paste0(my.dir,"/IND2009ER.RData"))

# END psidR example

# #####################################################################
# Please go to https://github.com/floswald/psidR for more example usage
# #####################################################################



