## ---- echo=FALSE, results='asis'-----------------------------------------
library(assertable); library(data.table)

## ---- results='asis', eval=FALSE-----------------------------------------
#  for(i in 1:3) {
#    data <- CO2
#    data$id_var <- i
#    write.csv(data,file=paste0("../data/file_",i,".csv"),row.names=F)
#  }

## ---- results='markup'---------------------------------------------------
filenames <- paste0("file_",c(1:3),".csv")
filenames <- system.file("extdata", filenames, package = "assertable")

filenames

## ---- results='markup'---------------------------------------------------
check_files(filenames)

## ---- results='markup'---------------------------------------------------
master_data <- import_files(filenames,FUN=fread)
head(master_data)

## ---- results='markup', error=TRUE---------------------------------------
assert_nrows(master_data,(84*3))
assert_colnames(master_data,c("plant","type","treatment","conc","uptake","id_var"))

## ---- results='markup'---------------------------------------------------
assert_nrows(master_data,(84*3))
assert_colnames(master_data,c("Plant","Type","Treatment","conc","uptake","id_var"))

## ---- results='markup'---------------------------------------------------
plants <- unique(master_data$Plant)
concs <- unique(master_data$conc)
id_vars <- unique(master_data$id_var)

id_list <- list(Plant=plants, conc=concs, id_var=id_vars)
assert_ids(master_data,id_list)

## ---- results='markup'---------------------------------------------------
assert_values(master_data, colnames = "Type", test="in", test_val = c("Quebec","Mississippi"))
assert_values(master_data, colnames = c("uptake","conc"), test="gt", test_val = 0)
assert_values(master_data, colnames = c("uptake","conc"), test="lt", test_val = 1500)

## ---- results='markup', error=TRUE---------------------------------------
assert_values(master_data, colnames = "conc", test="gt", test_val = master_data$uptake * 6)

## ---- results='markup'---------------------------------------------------
new_data <- master_data[master_data$Type == "Quebec" & master_data$Plant %in% c("Qn2","Qn3") & uptake > 20,]

## ---- results='markup', error=TRUE---------------------------------------
assert_ids(new_data, list(Plant=c("Qn2","Qn3"), conc=concs))

## ---- results='markup', error=TRUE---------------------------------------
new_concs <- c(175,250,350,500,675,1000)
assert_ids(new_data, list(Plant=c("Qn2","Qn3"),conc=new_concs))

## ---- results='markup', error=TRUE---------------------------------------
new_concs <- c(175,250,350,500,675,1000)
vetting_data <- assert_ids(new_data, list(Plant=c("Qn2","Qn3"),conc=new_concs), 
                           ids_only=F, warn_only=T)
print(head(vetting_data))

## ---- results='markup', error=TRUE---------------------------------------
new_concs <- c(175,250,350,500,675,1000)
assert_ids(new_data, list(Plant=c("Qn2","Qn3"), conc=new_concs, id_var=id_vars))

