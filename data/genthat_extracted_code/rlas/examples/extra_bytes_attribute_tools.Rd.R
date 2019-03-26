library(rlas)


### Name: extra_bytes_attribute_tools
### Title: Extra Bytes Attributes Tools
### Aliases: extra_bytes_attribute_tools header_add_extrabytes
###   header_add_extrabytes_manual

### ** Examples

data = data.frame(X = c(339002.889, 339002.983, 339002.918),
                  Y = c(5248000.515, 5248000.478, 5248000.318),
                  Z = c(975.589, 974.778, 974.471),
                  gpstime = c(269347.281418006, 269347.281428006, 269347.281438006),
                  Intensity = c(82L, 54L, 27L),
                  ReturnNumber = c(1L, 1L, 2L),
                  NumberOfReturns = c(1L, 1L, 2L),
                  ScanDirectionFlag = c(1L, 1L, 1L),
                  EdgeOfFlightline = c(1L, 0L, 0L),
                  Classification = c(1L, 1L, 1L),
                  ScanAngle = c(-21L, -21L, -21L),
                  UserData = c(32L, 32L, 32L),
                  PointSourceID = c(17L, 17L, 17L),
                  treeID = c(1L, 1L, 1L))

lasheader = header_create(data)
lasheader[["Variable Length Records"]]

lasheader = header_add_extrabytes(lasheader, data$treeID, "treeID", "An id for each tree")
lasheader[["Variable Length Records"]]



