library(DataVisualizations)


### Name: plotWorldmap
### Title: plots a world map by country codes
### Aliases: plotWorldmap
### Keywords: world map classification world map

### ** Examples

# data from [Thrun, 2018]
Cls=c(1L, 1L, 2L, 2L, 2L, 2L, 2L, 1L, 2L, 1L, 1L, 1L, 2L, 2L, 2L, 
2L, 2L, 1L, 2L, 2L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 2L, 1L, 1L, 1L, 
1L, 2L, 1L, 1L, 2L, 2L, 2L, 1L, 2L, 2L, 2L, 2L, 2L, 1L, 2L, 1L, 
2L, 2L, 2L, 1L, 2L, 2L, 2L, 1L, 1L, 1L, 1L, 3L, 2L, 2L, 2L, 1L, 
2L, 1L, 1L, 2L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 1L, 
1L, 2L, 2L, 2L, 1L, 2L, 1L, 2L, 1L, 1L, 2L, 2L, 1L, 1L, 1L, 2L, 
2L, 1L, 2L, 1L, 1L, 1L, 2L, 1L, 2L, 2L, 1L, 1L, 1L, 2L, 2L, 1L, 
2L, 2L, 1L, 2L, 2L, 1L, 2L, 1L, 2L, 2L, 2L, 1L, 2L, 1L, 1L, 1L, 
2L, 1L, 1L, 2L, 1L, 1L, 2L, 2L, 1L, 2L, 1L, 1L, 1L, 2L, 2L, 2L, 
2L, 2L, 2L, 1L, 1L, 2L, 2L, 2L, 2L, 1L, 2L, 2L, 2L, 1L, 1L, 1L
)
Codes=c("AFG", "AGO", "ALB", "ARG", "ATG", "AUS", "AUT", "BDI", "BEL", 
"BEN", "BFA", "BGD", "BGR", "BHR", "BHS", "BLZ", "BMU", "BOL", 
"BRA", "BRB", "BRN", "BTN", "BWA", "CAF", "CAN", "CH2", "CHE", 
"CHL", "CHN", "CIV", "CMR", "COG", "COL", "COM", "CPV", "CRI", 
"CUB", "CYP", "DJI", "DMA", "DNK", "DOM", "DZA", "ECU", "EGY", 
"ESP", "ETH", "FIN", "FJI", "FRA", "FSM", "GAB", "GBR", "GER", 
"GHA", "GIN", "GMB", "GNB", "GNQ", "GRC", "GRD", "GTM", "GUY", 
"HKG", "HND", "HTI", "HUN", "IDN", "IND", "IRL", "IRN", "IRQ", 
"ISL", "ISR", "ITA", "JAM", "JOR", "JPN", "KEN", "KHM", "KIR", 
"KNA", "KOR", "LAO", "LBN", "LBR", "LCA", "LKA", "LSO", "LUX", 
"MAC", "MAR", "MDG", "MDV", "MEX", "MHL", "MLI", "MLT", "MNG", 
"MOZ", "MRT", "MUS", "MWI", "MYS", "NAM", "NER", "NGA", "NIC", 
"NLD", "NOR", "NPL", "NZL", "OMN", "PAK", "PAN", "PER", "PHL", 
"PLW", "PNG", "POL", "PRI", "PRT", "PRY", "ROM", "RWA", "SDN", 
"SEN", "SGP", "SLB", "SLE", "SLV", "SOM", "STP", "SUR", "SWE", 
"SWZ", "SYC", "SYR", "TCD", "TGO", "THA", "TON", "TTO", "TUN", 
"TUR", "TWN", "TZA", "UGA", "URY", "USA", "VCT", "VEN", "VNM", 
"VUT", "WSM", "ZAF", "ZAR", "ZMB", "ZWE")
plotWorldmap(Codes,Cls)



