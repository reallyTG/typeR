library(diseasemapping)


### Name: kentucky
### Title: Larynx cancer cases and population in Kentucky
### Aliases: kentucky kentuckyTract larynx larynxRates
### Keywords: datasets

### ** Examples

data('kentucky')

head(larynx)
10^5*larynxRates[paste(c("M","F"), 50, sep="_")]


kentucky2 = getSMR(kentucky, larynxRates, larynx, 
		regionCode="County")

names(kentucky2)
length(kentucky2)

data('kentuckyTract')
length(kentuckyTract)

if(require('mapmisc', quietly=TRUE)) {
	mycol = colourScale(kentucky2$SMR, 
		breaks=10, dec=-log10(0.5), style='quantile')
	map.new(kentucky2)
	plot(kentucky2, col=mycol$plot, border='#00000040',add=TRUE)
	legendBreaks('topright', mycol)
} else {
	plot(kentucky2)
}

breaks = c(0,1,seq(2, ceiling(max(kentucky2$SMR,na.rm=TRUE)),by=2))
thecol = terrain.colors(length(breaks)-1)

plot(kentucky2, col = thecol[cut(kentucky2$SMR, 
	breaks,include.lowest=TRUE)] )

legend("topleft", pch=15, pt.cex=2.5, adj=c(0,15), 
  legend=rev(breaks), col=c(NA, rev(thecol)))

## Not run: 
##D 	# the data were created with
##D 	larynxRates= cancerRates("USA", year=1998:2002,site="Larynx")
##D 	
##D 	load(url("http://biogeo.ucdavis.edu/data/gadm2/R/USA_adm2.RData"))
##D 	kentucky = gadm[gadm$NAME_1 =="Kentucky",]
##D 
##D 	# population data
##D 	download.file(
##D 	"http://www.census.gov/popest/data/counties/asrh/2011/files/CC-EST2011-ALLDATA-21.csv",
##D 		destfile = 
##D 	"/store/patrick/spatialData/C-EST2011-ALLDATA-21.csv")
##D 	# file layout
##D 	download.file(
##D 	"http://www.census.gov/popest/data/counties/asrh/2011/files/CC-EST2011-ALLDATA.pdf",
##D 		destfile = "/store/patrick/spatialData/kentuckyPopFormat.pdf")
##D 
##D 	kpop = read.table(
##D 	"/store/patrick/spatialData/C-EST2011-ALLDATA-21.csv",
##D 		header=TRUE,as.is=TRUE,sep=",")	
##D 	kpop = kpop[kpop$YEAR==1 & kpop$AGEGRP != 0, ]
##D 	names(kpop) = gsub("^TOT_","", names(kpop))
##D 	names(kpop) = gsub("(EM)?ALE$","", names(kpop))
##D 	 
##D 	kpop$age = (kpop$AGEGRP-1)*5 
##D 	kpop$County =  gsub(" County$", "", kpop$CTYNAME)
##D 	kpop = kpop[,c("County","age","M","F")]
##D 	kpop2 = reshape(kpop,direction="wide", idvar="County",
##D 		v.names=c("M","F"), timevar="age")
##D 	rownames(kpop2) = kpop2$County
##D 
##D 		
##D 	# poverty
##D 	download.file(
##D 	paste(
##D 	"http://www.ers.usda.gov/ReportExport.aspx?reportPath=/State_Fact_Sheets/",
##D 	"PovertyReport&stat_year=2011&stat_type=0&fips_st=21&",
##D 	"exportType=EXCEL&exportName=PovertyReport",
##D 	sep=""),
##D 	destfile="/store/patrick/spatialData/poverty.xls")
##D 	library('gdata')
##D 	kpov = read.xls("/store/patrick/spatialData/poverty.xls",
##D 		header=TRUE,skip=3)
##D 	kpov = kpov[!is.na(kpov$Percent),c("FIPS.", "Name","Percent")]
##D 	rownames(kpov) = kpov$Name
##D 	kpop2$poverty = kpov[rownames(kpop2), "Percent"]
##D 	
##D 	# merge population and spatial data
##D 	kdata = kpop2[kentucky$NAME_2,]
##D 	rownames(kdata) = NULL
##D 	kentucky = SpatialPolygonsDataFrame(
##D 		polygons(kentucky),
##D 		data=kdata,match.ID=FALSE)
##D 
##D larynx <- structure(
##D list(County = c("Hickman", "Caldwell", "Anderson", 
##D "Marion", "Wayne", "Lincoln", "Livingston", "Montgomery", "Adair", 
##D "Henderson", "Knox", "Martin", "Monroe", "Wolfe", "Breathitt", 
##D "Fleming", "Woodford", "Garrard", "Bracken", "Barren", "Lawrence", 
##D "Logan", "Clark", "Scott", "Madison", "Oldham", "Clay", "Russell", 
##D "Shelby", "Letcher", "Campbell", "Graves", "Johnson", "Metcalfe", 
##D "Pulaski", "Bullitt", "Knott", "Boyd", "Ohio", "Bath", "Butler", 
##D "Todd", "Mercer", "Green", "Greenup", "Larue", "Calloway", "Webster", 
##D "Morgan", "Pendleton", "Mason", "Hardin", "Lewis", "McCreary", 
##D "Spencer", "Union", "Marshall", "Jessamine", "Henry", "Trigg", 
##D "Pike", "Nelson", "Jefferson", "Floyd", "Bourbon", "McCracken", 
##D "Boone", "Kenton", "Grayson", "Taylor", "Hopkins", "Boyle", "Meade", 
##D "Fayette", "Daviess", "Harlan", "Warren", "Christian", "Magoffin", 
##D "Carter", "Hart", "Lee", "Elliott", "Edmonson", "Crittenden", 
##D "Leslie", "Laurel", "Cumberland", "Menifee", "Fulton", "Carlisle", 
##D "McLean", "Owsley", "Carroll", "Estill", "Harrison", "Owen", 
##D "Breckinridge", "Nicholas", "Bell", "Trimble", "Allen", "Rowan", 
##D "Simpson", "Perry", "Powell", "Rockcastle", "Hancock", "Robertson", 
##D "Franklin", "Washington", "Casey", "Clinton", "Lyon", "Muhlenberg", 
##D "Ballard", "Gallatin", "Whitley", "Grant", "Jackson", "Breathitt", 
##D "Nicholas", "Bracken", "Todd", "Magoffin", "Pendleton", "Metcalfe", 
##D "Webster", "Leslie", "Henry", "Union", "Adair", "Casey", "Pike", 
##D "Jessamine", "Nelson", "Garrard", "Pulaski", "Meade", "Harlan", 
##D "Floyd", "Carter", "Shelby", "Barren", "Franklin", "Boyd", "Jefferson", 
##D "Fayette", "Hopkins", "Kenton", "Warren", "Bullitt", "Knox", 
##D "Butler", "Bourbon", "Elliott", "Johnson", "Estill", "Boone", 
##D "Boyle", "Breckinridge", "Bell", "Crittenden", "Cumberland", 
##D "Daviess", "Edmonson", "Calloway", "Caldwell", "Anderson", "Ballard", 
##D "Bath", "Allen", "Graves", "Clinton", "Fleming", "Fulton", "Gallatin", 
##D "Grayson", "Hardin", "Lincoln", "Green", "Greenup", "Hancock", 
##D "Grant", "Harrison", "Laurel", "Larue", "Henderson", "Hickman", 
##D "Lewis", "Letcher", "Hart", "Lawrence", "Lee", "Jackson", "Ohio", 
##D "Taylor", "Owen", "Monroe", "Madison", "Trigg", "Spencer", "Washington", 
##D "Trimble", "Scott", "Simpson", "Mason", "Marion", "Lyon", "Logan", 
##D "McCracken", "Mercer", "Menifee", "McCreary", "Marshall", "Martin", 
##D "McLean", "Woodford", "Wolfe", "Knott", "Montgomery", "Perry", 
##D "Powell", "Christian", "Clark", "Campbell", "Carlisle", "Carroll", 
##D "Robertson", "Rockcastle", "Rowan", "Russell", "Wayne", "Whitley", 
##D "Oldham", "Muhlenberg", "Owsley", "Livingston", "Morgan", "Clay"
##D ), 
##D Cases = c(2, 3, 3, 3, 4, 3, 1, 3, 3, 5, 3, 2, 2, 1, 2, 2, 
##D 2, 2, 1, 4, 2, 3, 4, 3, 7, 4, 2, 2, 3, 2, 6, 3, 1, 1, 5, 4, 1, 
##D 3, 1, 1, 1, 1, 1, 1, 3, 1, 2, 1, 1, 1, 1, 4, 1, 1, 1, 1, 2, 2, 
##D 1, 1, 3, 1, 28, 2, 1, 2, 3, 5, 1, 1, 2, 1, 1, 6, 2, 1, 2, 1, 
##D 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
##D 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
##D 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 2, 2, 1, 3, 1, 1, 1, 
##D 1, 1, 1, 1, 1, 11, 3, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
##D 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
##D 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
##D 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
##D 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 
##D sex = c("M", 
##D "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", 
##D "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", 
##D "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", 
##D "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", 
##D "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", 
##D "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", 
##D "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", 
##D "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", 
##D "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", 
##D "M", "M", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", 
##D "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", 
##D "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", 
##D "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", 
##D "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", 
##D "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", 
##D "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", 
##D "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", 
##D "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", 
##D "F", "F", "F", "F", "F")), 
##D .Names = c("County", "Cases", "sex"), 
##D row.names = 1:240, class = "data.frame")
##D larynx$age=NA
##D 
##D save(kentucky, larynx, larynxRates, 
##D 	file="~/workspace/diseasemapping/pkg/diseasemapping/data/kentucky.RData",
##D 	compress='xz')
## End(Not run)



