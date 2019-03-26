library(easySdcTable)


### Name: ReplaceDimList
### Title: ReplaceDimList
### Aliases: ReplaceDimList
### Keywords: internal

### ** Examples

# First generate dimLists
dimListA <- FindDimLists(SSBtoolsData("sprt_emp_withEU")[, c("geo", "eu", "age")])
dimListB <- FindDimLists(SSBtoolsData("sprt_emp_withEU")[, c("geo", "age")])
dimListC <- FindDimLists(SSBtoolsData("sprt_emp_withEU")[, c("geo", "eu")])

# dimListA1 and dimListA are identical
dimListA1 <- ReplaceDimList(dimListB, dimListC)
identical(dimListA, dimListA1)

# replaceList can be TauArgus coded
hcrC <- DimList2Hrc(dimListC)

# dimListA2 and dimListA are identical
dimListA2 <- ReplaceDimList(dimListB, hcrC)
identical(dimListA, dimListA2)

# Also possible when duplicated names
ReplaceDimList(FindDimLists(EasyData("z3")[, -7]), 
               FindDimLists(EasyData("z2")[, -5]))



