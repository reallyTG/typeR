library(SNSequate)


### Name: irt.link
### Title: IRT parameter linking methods
### Aliases: irt.link irt.link.default
### Keywords: IRT parameter linking

### ** Examples

#### Example. KB, Table 6.6
data(KB36)
parm.x = KB36$KBformX_par
parm.y = KB36$KBformY_par	
comitems = seq(3,36,3)
parm = as.data.frame(cbind(parm.y, parm.x))

# Table 6.6 KB
irt.link(parm,comitems,model="3PL",icc="logistic",D=1.7)


# Same data but assuming a 1PL model. The parameter estimates are load from 
# the KB36.1PL data set. See the help for KB36.1PL data for details on how these
# estimates were obtained using \code{lmer()} (see also Table 6.13 in KB)
 
data(KB36.1PL)

#preparing the input data matrices for irt.link() function
b.log.y<-KB36.1PL$b.logistic[,2]
b.log.x<-KB36.1PL$b.logistic[,1]
b.clog.y<-KB36.1PL$b.cloglog[,2]
b.clog.x<-KB36.1PL$b.cloglog[,1]

parm2 = as.data.frame(cbind(1,b.log.y,0, 1,b.log.x, 0))
parm3 = as.data.frame(cbind(1,b.clog.y,0, 1,b.clog.x,0))

#vector indicating common items
comitems = seq(3,36,3)

#Calculating the B constant under the logistic-link model
irt.link(parm2,comitems,model="1PL",icc="logistic",D=1.7)

#Calculating the B constant under the cloglog-link model
irt.link(parm3,comitems,model="1PL",icc="cloglog",D=1.7)



