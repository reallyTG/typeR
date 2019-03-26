library(RMark)


### Name: salamander
### Title: Salamander occupancy data
### Aliases: salamander
### Keywords: datasets

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
do.salamander=function()
{
   data(salamander)
   occ.p.dot=mark(salamander,model="Occupancy")
   occ.p.time=mark(salamander,model="Occupancy",
         model.parameters=list(p=list(formula=~time)))
   occ.p.mixture=mark(salamander,model="OccupHet",
         model.parameters=list(p=list(formula=~mixture)))
   return(collect.models())
}
salamander.results=do.salamander()
print(salamander.results)
## End(No test)



