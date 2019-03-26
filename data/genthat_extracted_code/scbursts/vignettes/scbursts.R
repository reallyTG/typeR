## ---- fig.show='hold', eval=FALSE, include = TRUE------------------------
#  # Load the library
#  library(scbursts)
#  
#  infile <- "data/example1_tac.evt"
#  
#  # Import the evt as a table
#  transitions <- evt.read(infile)
#  
#  # Turn the transition times into dwells
#  dwells <- evt.to_dwells(transitions)
#  
#  # With dwells defined, we can start doing an actual analysis

## ---- fig.show='hold', eval=FALSE, include = TRUE------------------------
#  # Write the corrected transition times to disk.
#  evt.write(dwells_corrected, file=file.path(tempdir(), "100uMc.evt"))

## ---- fig.show='hold', eval=FALSE, include = TRUE------------------------
#  dwells <- dwt.read("example1_qub.dwt")
#  
#  # ...
#  #
#  # Correct the dwells or do an analysis
#  #
#  # ...
#  
#  dwt.write(corrected_dwells, file=file.path(tempdir(), "example1_qub_corrected.dwt"))

## ---- fig.show='hold', eval=FALSE, include = TRUE------------------------
#  infile <- "data/example1_scan.txt"
#  record <- scan.read(infile)
#  head(record)

## ---- fig.show='hold', eval=FALSE, include = TRUE------------------------
#  infile <- "data/example1_clampfit.xlsx"
#  dwells <- clampfit.read(infile)
#  head(dwells)

## ---- fig.show='hold', eval=TRUE, include = TRUE-------------------------
# Load the library
library(scbursts)

# Import a pre-packaged file (stored inside the folder extdata)
dwt_example <- system.file("extdata", "example1_qub.dwt", package = "scbursts")

# Import the evt as a table
dwells <- dwt.read(dwt_example)
length(dwells)

# Transition times and states of first segment (units are in seconds)
head(dwells[[1]])

## ---- fig.show='hold', eval=TRUE, include = TRUE-------------------------
# Load the library
library(scbursts)

# Import a pre-packaged file (stored inside the folder extdata)
infile <- system.file("extdata", "example2_qub.dwt", package = "scbursts")

# Import the evt as a table
records <- dwt.read(infile)

# The number of records
length(records)

# Correct the risetime (= Tr) (default time in seconds)
records_c <- risetime.correct_gaussian(Tr=35.0052278,records, units="us")


# Define critical time (tcrit=100 ms)
# However, now we can use a `bursts` function, `bursts.defined_by_tcrit`
# to turn the records into actual bursts
bursts <- bursts.defined_by_tcrit(records_c , 100, units="ms")

# The number of bursts
length(bursts)

## Now you can carry out analysis of the bursts

## ---- fig.show='hold', eval=TRUE, include = TRUE-------------------------
# Load the library
library(scbursts)

# Import a pre-packaged file (stored inside the folder extdata)
infile <- system.file("extdata", "example1_tac.evt", package = "scbursts")

# Import the evt as a table
tables <- evt.read(infile)
records <- evt.to_dwells(tables)

# Correct the risetime (default time in seconds)
records_c <- risetime.correct_gaussian(Tr=35.0052278,records, units="us")

# Define critical time (tcrit=100 ms)
bursts <- bursts.defined_by_tcrit(records_c , 100, units="ms")

high_popen <- function (seg) {
    segment.popen(seg) > 0.7
}

high_bursts <- bursts.select(bursts, high_popen)

## ---- fig.show='hold', eval=FALSE, include = TRUE------------------------
#  high_bursts <- bursts.select(bursts, high_popen, one_file=TRUE)

## ---- eval=TRUE, include=TRUE--------------------------------------------
# library(scbursts)
infile <- system.file("extdata", "example2_qub.dwt", package = "scbursts")

# This will raise a warning message to alert you that the data has problems
dwells <- dwt.read(infile)

dwells_c <- risetime.correct_gaussian(Tr=35.0052278,dwells, units="us")

# This will also raise a warning message to alert you that specific bursts have problems
bad_bursts <- bursts.defined_by_tcrit(dwells_c, 100, units="ms")

length(bad_bursts)

# This will remove the problems. It will leave only the good bursts.
fixed_bursts <- bursts.select(bad_bursts, segment.verify)

length(fixed_bursts)

## ---- fig.show='hold', eval=TRUE, include = TRUE-------------------------
# If you have multiple records, you can recombine them with
# This is now just one list of spaced out segments.
records <- bursts.space_out(records, sep_factor=1000)
record <- bursts.recombine(records)

## ---- eval=TRUE, include=TRUE--------------------------------------------
# From example2_qub.dwt
times  <- sapply(fixed_bursts, segment.start_time)
popens <- sapply(fixed_bursts, segment.popen)

plot(times,popens, main="P(Open) Time Series with two records", ylab="P(Open) per Burst",
xlab="bursts seen over time (s)", ylim=c(0,1))
lines(times, popens)

## ---- eval=TRUE, include = TRUE------------------------------------------
# Create a list of bursts, sorted by your chosen function
sorted <- bursts.sort(bursts, segment.popen, reverse=TRUE)

# In some cases, it might be that multiple bursts share the same value
# and so the "order" is a bit arbitrary in those cases.
sorted[[1]]

## ---- eval=TRUE, include = TRUE------------------------------------------
mean(bursts.popens(bursts))

## ---- eval=FALSE, include = TRUE-----------------------------------------
#  bursts.popens <- function (bursts) { sapply(bursts, segment.popen) }

## ---- eval=TRUE, include = TRUE------------------------------------------
mean(sapply(bursts, segment.duration))

## ---- fig.show='hold', eval=TRUE, include = TRUE-------------------------
# Correct the risetime

corrected_records <- list()
for (i in 1:length(records)) {
    corrected_records[[i]] <- risetime.correct_gaussian(Tr=35.0052278, records[[i]], units="us")
}

# Write the corrected record to a .dwt file
dwt.write(corrected_records, file=file.path(tempdir(), "example1_qub_corrected.dwt"))

## ---- fig.show='hold', eval=TRUE, include = TRUE-------------------------
# Correct the risetime
records_c <- risetime.correct_gaussian(Tr=35.0052278, records, units="us")

# Write the corrected record to a .dwt file
dwt.write(records_c, file=file.path(tempdir(), "example1_qub_corrected.dwt"))

## ---- fig.show='hold', eval=TRUE, include = TRUE-------------------------
# Load the library
library(scbursts)

# Import a pre-packaged file (stored inside the folder extdata)
infile <- system.file("extdata", "example1_tac.evt", package = "scbursts")


# Import the evt as a table
tables <- evt.read(infile)

# Turn the transition times into dwells
records <- evt.to_dwells(tables)

# Correct the risetime (default time in seconds)
records_c <- risetime.correct_gaussian(Tr=35.0052278,records, units="us")


## ---- fig.show='hold', eval=FALSE, include = TRUE------------------------
#  evt.write(records_c, file=file.path(tempdir(), "example_corrected.evt"))

## ---- fig.show='hold', eval=TRUE, include = TRUE-------------------------
library(scbursts)

infile <- system.file("extdata", "example2_tac.evt", package = "scbursts")
transitions <- evt.read(infile)
dwells <- evt.to_dwells(transitions)

# Skipping risetime correction
bursts <- bursts.defined_by_tcrit(dwells,92,units='ms')

# We will be plotting with this
record <- bursts.recombine(bursts)

## ---- fig.show='hold', eval=TRUE, include = TRUE-------------------------
open_dwells <- segment.open_dwells(record)
hist(log10(open_dwells), axes=FALSE, breaks=length(record$dwells)/100)
cplot.log_root_axes(open_dwells)

## ---- fig.show='hold', eval=TRUE, include = TRUE-------------------------
closed_dwells <- segment.closed_dwells(record)
hist(log10(closed_dwells), axes=FALSE, breaks=length(record$dwells)/100)
cplot.log_root_axes(closed_dwells)

## ---- fig.show='hold', eval=TRUE, include = TRUE-------------------------
popens <- bursts.popens(bursts)
hist(popens, xlab="Burst P(Open)", breaks=30, xlim=c(0,1))

## ---- fig.show='hold', eval=TRUE, include = TRUE-------------------------
# To make this more visible, you can also export it as a large `.png` file
cplot.popen_ts(bursts)

## ---- eval=TRUE, include=TRUE--------------------------------------------
# From example2_qub.dwt
times  <- sapply(fixed_bursts, segment.start_time)
popens <- sapply(fixed_bursts, segment.popen)

plot(times,popens, main="P(Open) Time Series with two records", ylab="P(Open) per Burst",
xlab="bursts seen over time (s)", ylim=c(0,1))
lines(times, popens)

## ---- fig.show='hold', eval=TRUE, include = TRUE-------------------------
library(scbursts)

infile <- system.file("extdata", "example1_qub.dwt", package = "scbursts")
dwells <- dwt.read(infile)
# dwells <- dwt.read('example1.dwt')

bursts <- bursts.defined_by_tcrit(dwells,100,units='ms')
twoplus <- function(seg){
		return(segment.count_open(seg)>=2)
}
bursts_twoplus <- bursts.select(bursts,twoplus)
head(dwells[[1]])

## ---- fig.show='hold', eval=TRUE, include = TRUE-------------------------
infile <- system.file("extdata", "example1_tac.evt", package = "scbursts")
transitions <- evt.read(infile)

# transitions <- evt.read("July28-6.evt")

dwells <- evt.to_dwells(transitions)
dwells_c <- risetime.correct_gaussian(Tr=35.0052278, dwells, units="us")

# Get Header
header <- evt.extract_header(infile)

head(dwells_c[[1]])

## ---- fig.show='hold', eval=TRUE, include = TRUE-------------------------
library(scbursts)

infile <- system.file("extdata", "example1_scan.txt", package = "scbursts")
dwells <- scan.read(infile)
dwells_c <- risetime.correct_gaussian(Tr=35.0052278, dwells, units="us")

bursts <- bursts.defined_by_tcrit(dwells_c,100,units='ms')
twoplus <- function(seg){
		return(segment.count_open(seg)>=2)
}
bursts_twoplus <- bursts.select(bursts,twoplus)
head(bursts_twoplus[[1]])

## ---- fig.show='hold', eval=TRUE, include = TRUE-------------------------
library(scbursts)

infile <- system.file("extdata", "example1_qub.dwt", package = "scbursts")
dwells <- dwt.read(infile)
dwells_c <- risetime.correct_gaussian(Tr=35.0052278, dwells, units="us")

bursts <- bursts.defined_by_tcrit(dwells_c,100,units='ms')
twoplus <- function(seg){
		return(segment.count_open(seg)>=2)
}
bursts_twoplus <- bursts.select(bursts,twoplus)
head(bursts_twoplus[[1]])

## ---- fig.show='hold', eval=TRUE, include = TRUE-------------------------
library(scbursts)

infile <- system.file("extdata", "example1_clampfit.xlsx", package = "scbursts")
dwells <- clampfit.read(infile)
dwells_c <- risetime.correct_gaussian(Tr=35.0052278, dwells, units="us")

bursts <- bursts.defined_by_tcrit(dwells_c,100,units='ms')
twoplus <- function(seg) {
    return(segment.count_open(seg)>=2)
}
bursts_twoplus <- bursts.select(bursts,twoplus)
head(bursts_twoplus[[1]])

