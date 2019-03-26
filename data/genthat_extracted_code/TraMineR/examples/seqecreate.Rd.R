library(TraMineR)


### Name: seqecreate
### Title: Create event sequence objects.
### Aliases: seqecreate
### Keywords: Event sequences Data handling

### ** Examples

##Starting with states sequences
##Loading data
data(biofam)
## Creating state sequences
biofam.seq <- seqdef(biofam,10:25, informat='STS')
## Creating event sequences from biofam
biofam.eseq <- seqecreate(biofam.seq)

## Loading data
data(actcal.tse)
## Creating sequences
actcal.eseq <- seqecreate(id=actcal.tse$id, timestamp=actcal.tse$time,
	event=actcal.tse$event)
##printing sequences
actcal.eseq[1:10]
## Using the data argument
actcal.eseq <- seqecreate(data=actcal.tse)

## Example with missings
data(ex1) ## STS data with missing values

## Creating the state sequence object with by default
## the left missings and gaps coded as '*' and
## end missings coded as void ('%')
sqex1 <- seqdef(ex1[,1:13])
## and without ignoring right missings (coded as '*')
sqex1b <- seqdef(ex1[,1:13], right=NA)

## Compare the outcome
seqecreate(sqex1)
seqecreate(sqex1, tevent='state')
seqecreate(sqex1, tevent='state', end.event=attr(sqex1,'void'))
seqecreate(sqex1b, tevent='state')



