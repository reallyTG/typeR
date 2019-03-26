library(lifecontingencies)


### Name: demoIta
### Title: Italian population life tables for males and females
### Aliases: demoIta
### Keywords: datasets

### ** Examples

	#load and show
	data(demoIta)
	head(demoIta)
	#create sim92 life and actuarial table
	lxsim92<-demoIta$SIM92

	lxsim92<-lxsim92[!is.na(lxsim92) & lxsim92!=0]
	xsim92<-seq(0,length(lxsim92)-1,1)
	#create the table
	sim92lt=new("lifetable",x=xsim92,lx=lxsim92,name="SIM92")
	plot(sim92lt)



