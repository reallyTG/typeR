# TODO:   Creates data set slope_conv
# 
# Author: Miguel Alvarez
################################################################################

aspect_conv <- c(0,22.5,45,67.5,90,112.5,135,157.5,180,202.5,225,247.5,270,292.5,
		315,337.5)
names(aspect_conv) <- c("N","NNE","NE","ENE","E","ESE","SE","SSE","S","SSW","SW",
		"WSW","W","WNW","NW","NNW")

save(aspect_conv, file="M:/WorkspaceR/vegtable/data/aspect_conv.rda")
