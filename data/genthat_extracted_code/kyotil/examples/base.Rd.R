library(kyotil)


### Name: base.functions
### Title: Some Base Functions
### Aliases: cbinduneven binary binary2 f2c ftoi keepWarnings meanmed
###   methods4 myaggregate myreshapewide mysapply myscale mysystem mytapply
###   read.sv read.tsv table.prop unix table.cases table.cases.3
###   multi.outer myreshapelong mycor

### ** Examples


binary(5) ###  101
binary2(5, 4)

a=data.frame("x"=1:2)
b=data.frame("y"=3:5);#rownames(b)[3]=""
cbinduneven(list(a,b))

## Not run: 
##D # the formula in myreshapewide can only have one variable in the right hand side
##D     myreshapewide(fi~week, dat, c("ptid","stim"))
##D 
##D     myreshapelong(dat.201.neut, cols.to.be.stacked=c("MN.3","SF162","SVA.MLV"), 
##D         label.cols.to.be.stacked="antigen", new.col.name="y")
##D 
##D     myaggregate(subset(dat.poc, select=c(HIV, trt)), list(dat.poc$f), function(x) 
##D       with(x, c(fisher.test(HIV, trt)$estimate, fisher.test(HIV, trt)$p.value)))
##D 
##D 
## End(Not run)




