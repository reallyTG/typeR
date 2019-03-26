library(easySdcTable)


### Name: ProtectTable
### Title: Easy interface to sdcTable: Table suppression according to a
###   frequency rule.
### Aliases: ProtectTable

### ** Examples

 # ==== Example 1 , 8 regions ====
 z1 <- EasyData("z1")        
 ProtectTable(z1,1:2,3)
 ProtectTable(z1,c("region","hovedint") ,"ant") # Input by name 
 # --- Unstacked input data ---
 z1w = EasyData("z1w") 
 ProtectTable(z1w,1,2:5)
 ProtectTable(z1w,1,2:5,varName="hovedint") 
 ProtectTable(z1w,1,2:5,method="HITAS")
 ProtectTable(z1w,1,2:5,totalFirst = TRUE)
 
 # ==== Example 2 , 11 regions ====
 z2 <- EasyData("z2") 
 ProtectTable(z2,c(1,3,4),5) # With region-variable kostragr
 # --- Unstacked input data ---
 z2w <- EasyData("z2w") 
 ProtectTable(z2w,1:2,4:7) # With region-variable fylke
 ProtectTable(z2w,1:3,4:7) # Two linked tables
 
 ## Not run: 
##D  # ==== Example 3 , 36 regions ====
##D  z3 <- EasyData("z3")   
##D  ProtectTable(z3,c(1,4,5),7) # Three dimensions. No subtotals    
##D  ProtectTable(z3,1:6,7)      # Two linked tables  
##D  # --- Unstacked input data with coded column names 
##D  z3w <- EasyData("z3w")
##D  ProtectTable(z3w,1:3,4:15,varName="g12") # coding not used when single varName
##D  ProtectTable(z3w,1:3,4:15,varName=c("hovedint","mnd"))  # Two variables found automatically 
##D  ProtectTable(z3w,1:3,4:15,varName=c("hovedint","mnd"),
##D                removeTotal=FALSE) # Keep "Total" in variable names 
##D  # --- Unstacked input data with three level column name coding  
##D  ProtectTable(z3wb,1:3,4:15,varName=c("hovedint","mnd","mnd2")) # Two variables found automatically
##D  ProtectTable(z3wb,1:3,4:15,varName=c("hovedint","mnd","mnd2"), 
##D                split="_")  # Three variables when splitting
##D  ProtectTable(z3wb,1:3,4:15,varName=c("hovedint","mnd","mnd2"), 
##D                split="_",namesAsInput=FALSE,orderAsInput=FALSE) # Alternative ouput format
##D                
##D  # ====  Examples Tau-Argus ====              
##D  exeArgus <- "C:/TauArgus4.1.4/TauArgus.exe"
##D  pathArgus <- "C:/Users/nnn/Documents"
##D  z1 = EasyData("z1") 
##D  ProtectTable(z1,1:2,3,method=list(exe=exeArgus, path=pathArgus, typ="tabular", method="OPT")) 
##D  ProtectTable(z1,1:2,3,method=list(exe=exeArgus, path=pathArgus, typ="tabular", method="MOD")) 
##D  ProtectTable(z1,1:2,3,method=list(exe=exeArgus, path=pathArgus, typ="tabular", method="GH"))
##D   ProtectTable(z1,1:2,3,maxN=-1,
##D    method=list(path=pathArgus, exe=exeArgus, method="OPT",
##D          primSuppRules= list(list(type="freq", n=4, rg=20))))
##D  z3w <- EasyData("z3")
##D  ProtectTable(z3,c(1:2,4,5),7,maxN=-1,
##D    method=list(path=pathArgus, exe=exeArgus, method="OPT",
##D          primSuppRules=list(list(type="freq", n=4, rg=20))))
##D                
## End(Not run)
               
# ==== Examples with parameter dimList  ====
z2 <- EasyData("z2")
dList <- FindDimLists(z2[-5])
ProtectTable(z2[, c(1, 4, 5)], 1:2, 3, dimList = dList[c(1, 3)])
ProtectTable(z2[, c(1, 4, 5)], 1:2, 3, dimList = dList[2])
ProtectTable(z2[, c(1, 4, 5)], 1:2, 3, dimList = DimList2Hrc(dList[c(2, 3)]))              



