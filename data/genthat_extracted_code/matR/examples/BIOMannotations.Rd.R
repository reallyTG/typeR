library(matR)


### Name: BIOMannotations
### Title: Search and change row or column annotations of BIOM data
### Aliases: rows rows<- columns columns<-

### ** Examples

####  exact sampling locations returned in a data.frame
columns (xx3, "latitude|longitude")

####  a data.frame is returned even in case of a single matching metadata field
is.data.frame (columns (xx1, "sample.data.biome"))

####  project IDs and environmental package metadata -- note regex here and above
colnames (columns (xx2, "project\\.id|^env_package"))

####  row metadata makes annotation hierarchy levels available,
####  so typical row metadata has few components, and here just two
names (rows (xx1))
rows (xx1, "ontology1")

####  here, the rownames and the (single) variable of the data.frame coincide
rows (xx1, "ontology2")

####  variables are almost always coded as factors
is.factor (columns (xx1, "sample.data.biome") [[1]])



