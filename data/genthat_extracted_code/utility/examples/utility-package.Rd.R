library(utility)


### Name: utility-package
### Title: Construct, Evaluate and Plot Value and Utility Functions
### Aliases: utility-package utility
### Keywords: decision analysis; objectives hierarchy; value function;
###   utility function

### ** Examples

# define discrete end node for width variability
# (attribute "widthvariability_class" with levels "high", 
# "moderate" and "none")

widthvar <- 
  utility.endnode.discrete.create(
    name.node     = "width variability",
    attrib.levels = data.frame(widthvariability_class=
      c("high","moderate","none")),
    u             = c(1,0.4125,0),
    names.u       = c("u.high","u_moderate","u.none"),
    required      = FALSE,
    utility       = FALSE)

# define 1d interpolation end node for bed modification with 
# riprap
# (attribute "bedmodfract_percent" with levels from 0 to 100)

bedmod_riprap <-
  utility.endnode.intpol1d.create(
    name.node   = "bed modification riprap",
    name.attrib = "bedmodfract_percent",
    range       = c(0,100),
    x           = c(0,10,30,100),
    u           = c(1,0.775,0.5625,0.24),
    required    = FALSE,
    utility     = FALSE)

# define 1d interpolation end node for bed modification with 
# other material
# (attribute "bedmodfract_percent" with levels from 0 to 100)

bedmod_other <-
  utility.endnode.intpol1d.create(
    name.node   = "bed modification other",
    name.attrib = "bedmodfract_percent",
    range       = c(0,100),
    x           = c(0,10,30,100),
    u           = c(1,0.775,0.5625,0),
    required    = FALSE,
    utility     = FALSE)

# define combination end node for bed modification
# (attributes "bedmodtype_class" and "bedmodfract_percent")

bedmod <-
  utility.endnode.cond.create(
    name.node     = "bed modification",
    attrib.levels = data.frame(bedmodtype_class=
      c("riprap","other")),
    nodes         = list(bedmod_riprap,bedmod_other),
    required      = FALSE,
    utility       = FALSE)

# define 1d interpolation end node for bank modification with 
# permeable material
# (attribute "bankmodfract_percent" with levels from 0 to 100)

bankmod_perm <-
  utility.endnode.intpol1d.create(
    name.node   = "bank modification perm",
    name.attrib = "bankmodfract_percent",
    range       = c(0,100),
    x           = c(0,10,30,60,100),
    u           = c(1,0.8667,0.675,0.4125,0.24),
    required    = FALSE,
    utility     = FALSE)

# define 1d interpolation end node for bank modification with 
# impermeable material
# (attribute "bankmodfract_percent" with levels from 0 to 100)

bankmod_imperm <-
  utility.endnode.intpol1d.create(
    name.node   = "bank modification imperm",
    name.attrib = "bankmodfract_percent",
    range       = c(0,100),
    x           = c(0,10,30,60,100),
    u           = c(1,0.775,0.5625,0.24,0),
    required    = FALSE,
    utility     = FALSE)

# define combination end node for bank modification
# (attributes "bankmodtype_class" and "bankmodfract_percent")

bankmod <-
  utility.endnode.cond.create(
    name.node     = "bank modification",
    attrib.levels = data.frame(bankmodtype_class=
      c("perm","imperm")),
    nodes         = list(bankmod_perm,bankmod_imperm),
    required      = FALSE,
    utility       = FALSE)

# define 2d interpolation end node for riparian zone width
# (attributes "riparianzonewidth_m" and "riparianzonewidth_m")

riparzone_width <-
  utility.endnode.intpol2d.create(
    name.node   = "riparian zone width",
    name.attrib = c("riverbedwidth_m","riparianzonewidth_m"),
    ranges      = list(c(0,16),c(0,30)),
    isolines    = list(list(x=c(0,16),y=c(0,0)),
                       list(x=c(0,2,10,16),y=c(5,5,15,15)),
                       list(x=c(0,16),y=c(15,15)),
                       list(x=c(0,16),y=c(30,30))),
    u           = c(0.0,0.6,1.0,1.0),
    lead         = 1,
    utility      = FALSE)

# define discrete end node for riparian zone vegetation
# (attriute "riparianzoneveg_class" with levels "natural", 
# "seminatural" and "artificial")

riparzone_veg <-
  utility.endnode.discrete.create(
    name.node     = "riparian zone veg.",
    attrib.levels = data.frame(riparianzoneveg_class=
      c("natural","seminatural","artificial")),
    u             = c(1,0.5625,0),
    required      = FALSE,
    utility       = FALSE)

# define aggregation node for riparian zone

riparzone <-
  utility.aggregation.create(
    name.node = "riparian zone",
    nodes     = list(riparzone_width,riparzone_veg),
    name.fun  = "utility.aggregate.cobbdouglas",
    par       = c(1,1),
    required  = FALSE)

# define aggregation node for ecomorphological state

morphol <-
  utility.aggregation.create(
    name.node = "ecomorphology",
    nodes     = list(widthvar,bedmod,bankmod,riparzone),
    name.fun  = "utility.aggregate.mix",
    par       = c(0.25,0.25,0.25,0.25,0,0,1),
    names.par = c("w_widthvar","w_bedmod","w_bankmod","w_riparzone",
                  "w_add","w_min","w_cobbdouglas"),
    required  = TRUE)

# print individual definitions

print(widthvar)
print(bedmod)

# print all definitions

print(morphol)

# plot objectives hierarchy with attributes

plot(morphol)

# plot individual nodes:

plot(widthvar)
plot(widthvar,par=c(u_moderate=0.2))
plot(bedmod_other)
plot(bankmod)
#plot(riparzone_width)   # too slow for package installation

# plot selected node definitions of a hierarchy

plot(morphol,type="nodes",nodes=c("width variability",
                                  "bed modification other",
                                  "bank modification"))

# evaluate value function for data sets and plot colored hierarchies
# and table

attrib_channelized <- data.frame(widthvariability_class = "none",
                                 bedmodtype_class       = "riprap",
                                 bedmodfract_percent    = 50,
                                 bankmodtype_class      = "imperm",
                                 bankmodfract_percent   = 70,
                                 riverbedwidth_m        = 10,
                                 riparianzonewidth_m    = 5,
                                 riparianzoneveg_class  = "seminatural")
attrib_rehab       <- data.frame(widthvariability_class = "high",
                                 bedmodtype_class       = "riprap",
                                 bedmodfract_percent    = 50,
                                 bankmodtype_class      = "imperm",
                                 bankmodfract_percent   = 20,
                                 riverbedwidth_m        = 15,
                                 riparianzonewidth_m    = 15,
                                 riparianzoneveg_class  = "natural")

res_channelized     <- evaluate(morphol,attrib=attrib_channelized)
res_channelized_add <- evaluate(morphol,attrib=attrib_channelized,
                                par=c(w_add=1,w_min=0,w_cobbdouglas=0))
res_rehab           <- evaluate(morphol,attrib=attrib_rehab)
res_both            <- rbind(res_channelized,res_rehab)
rownames(res_both)  <- c("channelized","rehabilitated")

plot(morphol,u=res_channelized)
plot(morphol,u=res_channelized_add)
plot(morphol,u=res_rehab)
plot(morphol,u=res_rehab,uref=res_channelized)
plot(morphol,u=res_both,type="table",plot.val=FALSE)
plot(morphol,u=res_both,type="table",plot.val=FALSE,print.val=FALSE)
plot(morphol,u=res_both,uref=res_channelized,type="table",plot.val=FALSE)

# consideration of uncertain attribute levels 
# (Higher uncertainty for predicted state after rehabilitation than for 
# observed channelized state.
# Note that the normal distributions lead to a small probability of attribute 
# levels beyond the range for which the value function is defined. This could
# be corrected for by truncating or choosing another distribution. We keep 
# those values to demonstrate that this leads to warnings when evaluating the
# value function for these attribute levels,):

sampsize <- 1000

attrib_channelized_unc <- data.frame(
  widthvariability_class = rep("high",sampsize),
  bedmodtype_class       = rep("riprap",sampsize),
  bedmodfract_percent    = rnorm(sampsize,mean=50,sd=5),
  bankmodtype_class      = rep("imperm",sampsize),
  bankmodfract_percent   = rnorm(sampsize,mean=70,sd=5),
  riverbedwidth_m        = rep(10,sampsize),
  riparianzonewidth_m    = rep(5,sampsize),
  riparianzoneveg_class  = c("seminatural","artificial")[rbinom(sampsize,1,0.5)+1])

attrib_rehab_unc <- data.frame(
  widthvariability_class = c("moderate","high")[rbinom(sampsize,1,0.5)+1],
  bedmodtype_class       = rep("riprap",sampsize),
  bedmodfract_percent    = rnorm(sampsize,mean=50,sd=15),
  bankmodtype_class      = rep("imperm",sampsize),
  bankmodfract_percent   = rnorm(sampsize,mean=20,sd=5),
  riverbedwidth_m        = rnorm(sampsize,mean=10,sd=2),
  riparianzonewidth_m    = rnorm(sampsize,mean=10,sd=2),
  riparianzoneveg_class  = c("natural","seminatural")[rbinom(sampsize,1,0.5)+1])

res_channelized_unc <- evaluate(morphol,attrib=attrib_channelized_unc)
res_rehab_unc       <- evaluate(morphol,attrib=attrib_rehab_unc)

plot(morphol,u=res_channelized_unc)
#plot(morphol,u=res_rehab_unc)
plot(morphol,u=res_rehab_unc,uref=res_channelized_unc)
plot(morphol,u=list(channelized=res_channelized_unc,rehabilitated=res_rehab_unc),
     type="table")
plot(morphol,u=list(channelized=res_channelized_unc,rehabilitated=res_rehab_unc),
     type="table",nodes=c("ecomorphology","riparian zone"))
plot(morphol,u=list(channelized=res_channelized_unc,rehabilitated=res_rehab_unc),
     type="table",levels=2)
plot(morphol,u=list(channelized=res_channelized_unc,rehabilitated=res_rehab_unc),
     uref=res_channelized_unc,
     type="table")



