library(RPPanalyzer)


### Name: plotTimeCourse
### Title: Draw time course from RPPA data
### Aliases: plotTimeCourse
### Keywords: hplot

### ** Examples

	library(RPPanalyzer)
	data(dataII)
	plotTimeCourse(dataII,
		tc.identifier=c("sample","stimulation","stim_concentration","inhibition")
        ,plot.split="experiment",plotformat="stderr")
    plotTimeCourse(dataII,
		tc.identifier=c("sample","stimulation","stim_concentration","inhibition")
        ,plot.split="experiment",plotformat="errbar")
    plotTimeCourse(dataII,
		tc.identifier=c("sample","stimulation","stim_concentration","inhibition")
        ,plot.split="experiment",plotformat="both")
    plotTimeCourse(dataII,
		tc.identifier=c("sample","stimulation","stim_concentration","inhibition")
        ,plot.split="experiment",plotformat="rawdata")
    plotTimeCourse(dataII,
		tc.identifier=c("sample","stimulation","stim_concentration","inhibition")
        ,plot.split="experiment",plotformat="spline")
    plotTimeCourse(dataII,
		tc.identifier=c("sample","stimulation","stim_concentration","inhibition")
        ,plot.split="experiment",plotformat="spline_noconf")
               



