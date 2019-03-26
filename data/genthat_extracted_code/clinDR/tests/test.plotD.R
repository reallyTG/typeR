library(clinDR)


if(file.exists("./clinDR/inst/tests/extraGraphics/pdfoutput")){
	pvar<-"./clinDR/inst/tests/extraGraphics/pdfoutput"
} else pvar<-NULL

if(file.exists(file.path(pvar,"output.plotD_new.pdf"))) file.rename(file.path(pvar,"output.plotD_new.pdf"), 
																																				 file.path(pvar,"output.plotD_old.pdf"))
	
pdf(file=paste(file.path(pvar,"output.plotD_new.pdf")))


data(examples14) 
dat<-examples14[[6]]



with(dat,plotD(y,dose,sem=sem,meansOnly=TRUE,ylab=
                 "Change from baseline LDL",xlab="Dose (mg)"))


with(dat,plotD(y,dose,sem=sem,meansOnly=TRUE,ylab=
                 "Change from baseline LDL",xlab="Log Dose (mg)",log=TRUE))

dev.off()
