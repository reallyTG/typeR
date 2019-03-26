library(r4ss)


### Name: NegLogInt_Fn
### Title: Perform SS implementation of Laplace Approximation
### Aliases: NegLogInt_Fn

### ** Examples


  ## Not run: 
##D     direc <- "C:/Models/LaplaceApprox/base"  #need the full path because wd is changed in function
##D     if("Optimization_record.txt" %in% list.files(direc)) {
##D          file.remove(file.path(direc,"Optimization_record.txt"))
##D     }
##D     Opt = optimize(f=NegLogInt_Fn,
##D                    interval=c(0.001, 0.12),
##D                    maximum=FALSE,
##D                    File=direc,
##D                    CTL_linenum_List=list(127:131),
##D                    ESTPAR_num_List=list(86:205),
##D                    Int_Group_List=1,
##D                    PAR_num_Vec=NA,
##D                    Version=1, Intern=TRUE)
##D   
## End(Not run)



