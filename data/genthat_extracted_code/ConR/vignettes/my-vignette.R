## ----loadData,include=FALSE----------------------------------------------
library(ConR)
data(dataset.ex)
MyData <- dataset.ex
MyData <- MyData[which(!MyData[,3] %in% c("species_1", "species_2")),]

## ----TableData,include=TRUE, echo=FALSE----------------------------------
knitr::kable(head(MyData))

## ----include=TRUE--------------------------------------------------------
head(MyData)

## ----include=TRUE, echo = FALSE------------------------------------------
EOO.computing(MyData)

## ----include=TRUE, echo = TRUE-------------------------------------------
EOO.computing(MyData, export_shp = T)

## ----include=FALSE, echo = FALSE-----------------------------------------
EOO.results <- EOO.computing(MyData, export_shp = T)

## ----include=TRUE, echo = TRUE, dev.args=list(pointsize=2)---------------
plot(EOO.results[[1]][[2]], col="grey")

## ----include=TRUE, echo = TRUE, dev.args=list(pointsize=2)---------------
data(land)

## ----include=TRUE, echo = TRUE, dev.args=list(pointsize=2)---------------
plot(EOO.results[[1]][[2]], col="grey")
plot(land, add=T)

## ----include=TRUE, echo = TRUE, dev.args=list(pointsize=2)---------------
plot(EOO.results[[2]][[2]], col="red")
plot(land, add=T)

## ----include=TRUE, echo = TRUE-------------------------------------------
EOO.computing(MyData, exclude.area = T, country_map = land)

## ----include=TRUE, echo = TRUE-------------------------------------------
EOO.computing(MyData, exclude.area = F, country_map = land)

## ----include=TRUE, echo = TRUE, dev.args=list(pointsize=4)---------------
EOO.results <- EOO.computing(MyData, exclude.area = T, country_map = land, export_shp = T)
plot(EOO.results[[2]][[2]], col="red")
plot(land, add=T)

## ----include=TRUE, echo = TRUE-------------------------------------------
EOO.computing(MyData, method.range = "alpha.hull")

## ----include=TRUE, echo = TRUE, dev.args=list(pointsize=2)---------------
EOO.results <- EOO.computing(MyData, method.range = "alpha.hull", export_shp = T)
plot(EOO.results[[1]][[2]], col="red")
plot(land, add=T)

## ----include=TRUE, echo = TRUE, dev.args=list(pointsize=2)---------------
EOO.results <- EOO.computing(MyData, method.range = "alpha.hull", export_shp = T, alpha=5)
plot(EOO.results[[2]][[2]], col="red")
plot(land, add=T)

## ----include=TRUE, echo = TRUE, dev.args=list(pointsize=2)---------------
EOO.results <- EOO.computing(MyData, method.range = "alpha.hull", export_shp = T, alpha=5, exclude.area = T, country_map = land)
plot(EOO.results[[2]][[2]], col="red")
plot(land, add=T)

## ----include=FALSE-------------------------------------------------------
MyData <- dataset.ex
MyData <- MyData[which(MyData[,3] %in% c("species_2")),]

## ----include=TRUE, echo = TRUE, dev.args=list(pointsize=2)---------------
EOO.results <- EOO.computing(MyData, export_shp = T)
plot(EOO.results[[1]][[2]], col="red")
points(MyData[,2], MyData[,1], pch=19) ### map the occurrences.

## ----include=FALSE-------------------------------------------------------
MyData <- dataset.ex
MyData <- MyData[which(MyData[,3] %in% c("species_1")),]

## ----include=TRUE, echo = TRUE, dev.args=list(pointsize=5)---------------
EOO.results <- EOO.computing(MyData, export_shp = T)
EOO.results

## ----include=FALSE-------------------------------------------------------
data(dataset.ex)
MyData <- dataset.ex

## ----include=TRUE, echo = TRUE, dev.args=list(pointsize=5)---------------
SUB <- subpop.comp(MyData, Resol_sub_pop=30)
SUB
plot(SUB[["Platycoryne guingangae"]][["subpop.poly"]], col="red")
plot(land, add=TRUE)

## ----include=FALSE-------------------------------------------------------
data(dataset.ex)
MyData <- dataset.ex

## ----include=TRUE, echo=FALSE--------------------------------------------
knitr::kable(head(MyData))

## ----include=FALSE, echo=FALSE-------------------------------------------
MyData2 <- MyData
MyData2 <- MyData2[order(MyData2[,3]),]
head(MyData2)
MyData2 <- cbind(MyData2, c(rep("Fabaceae", table(dataset.ex[,3])[1]), 
                            rep("Arecaceae", table(dataset.ex[,3])[2]), 
                            rep("Orchidaceae", table(dataset.ex[,3])[3]), 
                            rep("Rubiaceae", table(dataset.ex[,3])[4]),
                            rep("Familiaceae", table(dataset.ex[,3])[5]), 
                            rep("Familiaceae", table(dataset.ex[,3])[6])))
colnames(MyData2)[4] <- "higher.tax.rank"
MyData2 <- cbind(MyData2, sample(1780:2016, nrow(MyData2), replace = T))
colnames(MyData2)[5] <- "coly"
head(MyData2)
rownames(MyData2) <- rownames(MyData)

## ----include=TRUE--------------------------------------------------------
head(MyData)

## ----include=TRUE--------------------------------------------------------
head(MyData2)

## ----include=T, echo=TRUE------------------------------------------------
IUCN.eval(MyData)

## ----include=FALSE, echo=TRUE--------------------------------------------
MyResults <- IUCN.eval(MyData)

## ----include=TRUE, echo=FALSE--------------------------------------------
head(MyResults)

## ----include=T, echo=FALSE-----------------------------------------------
knitr::kable(head(MyResults))

## ----include=F, echo=FALSE-----------------------------------------------
MyResults <- IUCN.eval(MyData2, file_name="MyIUCNresults")

## ----include=FALSE, echo=FALSE-------------------------------------------
data(Malagasy.amphibian)
MyData <- Malagasy.amphibian[which(Malagasy.amphibian[,"tax"] %in% c("Anodonthyla moramora")),]
IUCN.eval(MyData, Cell_size_locations = 10)

## ----include=F, echo=F---------------------------------------------------
IUCN.eval(MyData, Cell_size_locations = 10, file_name = "loc1")

## ----include=FALSE-------------------------------------------------------
MyData <- dataset.ex
MyData <- MyData[which(MyData[,3] %in% c("Psychotria minuta")),]

## ----include=TRUE, echo=TRUE---------------------------------------------
MyResults <- IUCN.eval(MyData, Cell_size_AOO = 20)
MyResults

## ----include=TRUE--------------------------------------------------------
data(Malagasy.amphibian)
MyData <- Malagasy.amphibian[which(Malagasy.amphibian[,"tax"] %in% c("Anodonthyla moramora")),]

## ----include=T, echo=T---------------------------------------------------
IUCN.eval(MyData, Cell_size_locations = 10)

## ----include=F, echo=F---------------------------------------------------
IUCN.eval(MyData, Cell_size_locations = 10, file_name = "loc1")

## ----include=T, echo=T---------------------------------------------------
IUCN.eval(MyData, Cell_size_locations = 30)

## ----include=F, echo=F---------------------------------------------------
IUCN.eval(MyData, Cell_size_locations = 30, file_name = "loc2")

## ----include=T, echo=T---------------------------------------------------
IUCN.eval(MyData, Cell_size_locations = 50)

## ----include=F, echo=F---------------------------------------------------
IUCN.eval(MyData, Cell_size_locations = 50, file_name = "loc3")

## ----include=F, echo=F---------------------------------------------------
IUCN.eval(MyData, method_locations = "sliding scale", Rel_cell_size = 0.05)

## ----include=F, echo=F---------------------------------------------------
IUCN.eval(MyData, method_locations = "sliding scale", Rel_cell_size = 0.05, file_name = "slide")

## ----include=F, echo=F---------------------------------------------------
data(Madagascar.protec) # This code line load the Malagasy protected area shapefile included in ConR
IUCN.eval(MyData, Cell_size_locations = 10, file_name = "protec", protec.areas = Madagascar.protec)

## ----include=F, echo=F---------------------------------------------------
data(Madagascar.protec)
IUCN.eval(MyData, Cell_size_locations = 10, file_name = "protec2", protec.areas = Madagascar.protec, method_protected_area = "other")

## ----include=F, echo=F---------------------------------------------------
data(Madagascar.protec)
data(Malagasy.amphibian)
MyResults <- IUCN.eval(Malagasy.amphibian, protec.areas = Madagascar.protec, ID_shape_PA = "WDPA_PID", showWarnings = FALSE, DrawMap=FALSE, SubPop = FALSE, write_file_option="csv")

## ----include=F, echo=F---------------------------------------------------
MyResults <- read.csv("IUCN_results.csv", row.names=1)
map.res(MyResults, Occurrences=Malagasy.amphibian, country_map=land, export_map=TRUE, threshold=3, 
 	LatMin=-25,LatMax=-12,LongMin=42, LongMax=52, Resol=1)

## ----include=F, echo=F---------------------------------------------------
files <- list.files(paste(getwd(), "/MyIUCNresults_results_map/", sep=""), full.names = T)
file.remove(files[-grep("Berlinia_bruneelii", files)])
#files <- list.files(paste(getwd(), "/", sep=""), full.names = T)
#unlink(files[grep("Berlinia_bruneelii", files)])

