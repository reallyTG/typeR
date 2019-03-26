library(rasterList)


### Name: rasterListFun
### Title: Execution of the elements of a 'RasterList'
### Aliases: rasterListFun

### ** Examples


library(sp)
library(rasterList)
library(soilwater)
set.seed(1234)
data(meuse.grid)
data(meuse)
coordinates(meuse.grid) <- ~x+y
coordinates(meuse) <- ~x+y
gridded(meuse.grid) <- TRUE

## Not run: 
##D soilmap <- stack(meuse.grid)[['soil']]
##D elevmap <- rasterize(x=meuse,y=soilmap,field="elev",fun=mean)
##D soilparcsv <- system.file("external/soil_data.csv",package="soilwater")
##D soilpar <- read.table(soilparcsv,stringsAsFactors=FALSE,header=TRUE,sep=",")
##D ## From help(meuse,help_type="html")
##D ##soil type according to the 1:50 000 soil map of the Netherlands. 
##D ## 1 = Rd10A (Calcareous weakly-developed meadow soils, light sandy clay); 
##D ## 2 = Rd90C/VII (Non-calcareous weakly-developed meadow soils, heavy sandy clay to light clay); 
##D ## 3 = Bkd26/VII (Red Brick soil, fine-sandy, silty light clay)
##D soiltype_id <- c(1,2,3)
##D soiltype_name <- c("sandy clay","sandy clay","silty clay loam")
##D 
##D meuse.soilrasterlist <- rasterList(soilmap,FUN=function(i,soiltype_name,soilpar){
##D 			
##D 		o <- NULL
##D 		if (!is.na(i)) {
##D 			ii <- which(soilpar$type==soiltype_name[i])	
##D 		    o <- soilpar[ii,]				
##D 			type <- o[["type"]]
##D 			o <- o[names(o)!="type"]
##D 			o <- o[names(o)!="Ks_m_per_hour"]
##D 			names(o)[names(o)=="Ks_m_per_sec"] <- "ks"
##D 			names(o)[names(o)=="swc"] <- "theta_sat"
##D 			names(o)[names(o)=="rwc"] <- "theta_res"
##D 			attr(o,"type") <- type
##D 			## add noise
##D 			noise <- rnorm(length(o))
##D 			o <- o*(1+0.005*noise)
##D 				
##D 			o["m"] <- 1-1/o["n"]
##D 				
##D 				
##D 		} else {
##D 				
##D 			o <- soilpar[which(soilpar$type==soiltype_name[1]),]
##D 			type <- o[["type"]]
##D 			o <- o[names(o)!="type"]
##D 			o <- o[names(o)!="Ks_m_per_hour"]
##D 			names(o)[names(o)=="Ks_m_per_sec"] <- "ks"
##D 			names(o)[names(o)=="swc"] <- "theta_sat"
##D 			names(o)[names(o)=="rwc"] <- "theta_res"
##D 			o[] <- NA
##D 		}
##D 			
##D 		return(o)
##D },soiltype_name=soiltype_name,soilpar=soilpar)
##D 
##D 
##D meuse.swclist <- rasterList(meuse.soilrasterlist,FUN=function(x) {
##D 			
##D 			o <- NA
##D ##			swc       rwc   alpha       n         m           ks
##D ##			9 0.4295507 0.1093227 3.39387 1.39617 0.2837546 2.018317e-07
##D 		
##D 			
##D 			o <- function(psi,...,func="swc"){
##D 				
##D 				args <- c(list(psi=psi,...),as.list(x))
##D 				oo <- do.call(args=args,what=get(func))
##D 				return(oo)
##D 				
##D 			}
##D 			
##D 			
##D 			
##D 			
##D 			
##D 			
##D 			
##D 			return(o)
##D 			
##D 		})
##D 
##D 
##D ### RasterList with soil water retenction curves (One for each cell!) 
##D 
##D swcfunr <- rasterListFun(meuse.swclist)
##D 
##D ## RasterLayer of soil water content assuming a uniformly distrrubted pressure head 
##D psi <- -0.9
##D soil_water_content <- raster(swcfunr(psi))
##D plot(soil_water_content)
##D 
##D ## RasterLayer of soil water content from  a generic map of soil water pressure head
##D psi <- 0.2-(elevmap-(5))
##D psi[] <- -0.9+0.1*rnorm(ncell(psi[])) ## Alternatively to the values of the previous line!
##D soil_water_content <- raster(swcfunr(psi))
##D plot(soil_water_content)
##D 
##D ## END 
## End(Not run)




