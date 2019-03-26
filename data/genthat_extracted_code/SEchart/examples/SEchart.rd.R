library(SEchart)


### Name: SEchart
### Title: Graphically display states and events in longitudinal data
### Aliases: SEchart
### Keywords: event chart, longitudinal, plot

### ** Examples

#Example using aids dataset from package JM
library(JM) 
data(aids)

#Assign class numeric to aids$patient and aids$prevOI (class factor is not allowed in function)
aids$patient <- as.numeric(aids$patient)
aids$prevOI.2 <- as.numeric(aids$prevOI)

#Categorize CD4
aids$CD4.cat <- cut(aids$CD4, breaks=10, labels=FALSE)

#For better results, use pdf()
# pdf(file = "PATH/SEchart_aids.pdf", width = 12, height = 20)

#Create SEchart for subset of aids data, with event=death and state=CD4. 
#Sort subjects by (1) occurrence of event "death" and (2) their observed end 
#time. The chart is stratified by "aids diagnosis at study entry" (variable 
#"prevOI.2").

SEchart(data=aids[aids$patient <= 100,],
	idvar="patient",
	timevar.start = "start",
	timevar.stop = "stop",
	statevar="CD4.cat",
	eventvar="event",
	eventtime="end",
	srt1="tf.event",
	srt2="end.time",
	stratvar="prevOI.2",
	strat.txt=c("No aids diagnosis at study entry", "Aids diagnosis at study entry"),
	l.state.col="pal.heat",
	idnum.cex=0.5,
	legnd = TRUE,
	)

#Close the graphics device to save as pdf
# graphics.off()



