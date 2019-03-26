library(RSAlgaeR)


### Name: formatSRdata
### Title: formatSRdata
### Aliases: formatSRdata

### ** Examples

data(srdata)
formattedsrdata <- formatSRdata(data=srdata,value="FieldValue",imagerydate="ImageDate",
samplingdate="SamplingDate",location="StationID",
datatype="Calibration",qaband="CloudMask",qa_accept=c(0,1))



