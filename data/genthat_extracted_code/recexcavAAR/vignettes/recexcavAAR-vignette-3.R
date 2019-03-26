## ---- echo=FALSE---------------------------------------------------------
# check if pandoc is available
if (requireNamespace("rmarkdown") && !rmarkdown::pandoc_available("1.13.1"))
stop("These vignettes assume pandoc version 1.13.1; older versions will not work.")
# see https://r-forge.r-project.org/forum/message.php?msg_id=43797&group_id=234

## ---- message=FALSE------------------------------------------------------
library(recexcavAAR)

## ------------------------------------------------------------------------
proj <- data.frame(
	E = c(578171.033, 578168.680, 578178.780),
	N = c(6017854.028, 6017859.595, 6017856.277)
)

## ------------------------------------------------------------------------
coord <- data.frame(
	proj,
	X = c(1, 1, 9),
	Y = c(7, 1, 0)
)

## ------------------------------------------------------------------------
measured_points <- data.frame(
	x = c(1,6,1,6),
	Y = c(3,3,5,5),
	point = c("corner1", "corner2", "corner3", "corner4")
)

## ------------------------------------------------------------------------
absolute_data <- cootrans(coord, c(3,4,1,2), measured_points, c(1,2))

## ---- message=FALSE, fig.width=7, fig.height=5---------------------------
check_data <- cootrans(coord, c(3,4,1,2), measured_points, c(1,2), checking = TRUE)

## ------------------------------------------------------------------------
check_data

## ------------------------------------------------------------------------
corr_coord <- data.frame(
	proj,
	X = c(1, 1, 9),
	Y = c(1, 7, 0)
)

## ---- fig.width=7, fig.height=5------------------------------------------
check_data <- cootrans(corr_coord, c(3,4,1,2), measured_points, c(1,2), checking = TRUE)

## ------------------------------------------------------------------------
absolute_data <- cootrans(corr_coord, c(3,4,1,2), measured_points, c(1,2))

