library(PhysicalActivity)


### Name: readCountsData
### Title: Convert Accelerometer Output Data to a Correct Data Format
### Aliases: readCountsData

### ** Examples

###############################################################################
## Read accelerometer output and convert to a correct format (TimeStamp, counts)
## Suppose "rawActigraphOutput.dat" is an Actigraph output with header as follows:
###############################################################################
## --- Data File Created By ActiGraph GT1M ActiLife v4.4.1 Firmware v7.2.0 ---
## Serial Number: LYN2B21080027
## Start Time 16:15:00
## Start Date 6/16/2010
## Epoch Period (hh:mm:ss) 00:00:01
## Download Time 09:50:23
## Download Date 6/22/2010
## Current Memory Address: 983038
## Current Battery Voltage: 4.01     Mode = 0
## --------------------------------------------------
###############################################################################
## This raw data with 1-sec epoch can be converted to a correct data format to
## classify wear and nonwear time using "wearingMarking" by the following code:

## Not run: mydata1s = readCountsData("rawActigraphOutput.dat", ctPerSec=1)



