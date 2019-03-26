library(RMark)


### Name: mark.wrapper.parallel
### Title: Constructs and runs in parallel a set of MARK models from a
###   dataframe of parameter specifications
### Aliases: mark.wrapper.parallel
### Keywords: utility

### ** Examples

## No test: 
# example not run to reduce time required for checking
do.MSOccupancy=function()
{
#  Get the data
	data(NicholsMSOccupancy)
# Define the models; default of Psi1=~1 and Psi2=~1 is assumed
# p varies by time but p1t=p2t
	p1.p2equal.by.time=list(formula=~time,share=TRUE)
# time-varying p1t and p2t
	p1.p2.different.time=list(p1=list(formula=~time,share=FALSE),p2=list(formula=~time))
#  delta2 model with one rate for times 1-2 and another for times 3-5;
# delta2 defined below
	Delta.delta2=list(formula=~delta2)
	Delta.dot=list(formula=~1)  # constant delta
	Delta.time=list(formula=~time) # time-varying delta
# Process the data for the MSOccupancy model
	NicholsMS.proc=process.data(NicholsMSOccupancy,model="MSOccupancy")
# Create the default design data
	NicholsMS.ddl=make.design.data(NicholsMS.proc)
# Add a field for the Delta design data called delta2.  It is a factor variable
# with 2 levels: times 1-2, and times 3-5.
	NicholsMS.ddl=add.design.data(NicholsMS.proc,NicholsMS.ddl,"Delta",
			type="time",bins=c(0,2,5),name="delta2")
# Create a list using the 4 p modls and 3 delta models (12 models total)
	cml=create.model.list("MSOccupancy")
# Fit each model in the list and return the results
	return(mark.wrapper.parallel(cml,data=NicholsMS.proc,ddl=NicholsMS.ddl,
    cpus=2,parallel=TRUE))
}
xx=do.MSOccupancy()
## End(No test)



