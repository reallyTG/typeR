library(taxlist)


### Name: print_name
### Title: Format Usage Names for Publications
### Aliases: print_name print_name,taxlist,numeric-method
### Keywords: methods

### ** Examples

## Example using Rmarkdown
library(taxlist)
data(Easplist)
summary(Easplist, 363, secundum="secundum")

## Empty plot
plot(NA, xlim=c(0,5), ylim=c(6,1), bty="n", xaxt="n", xlab="", ylab="options")

## Accepted name with author
text(0, 1, labels=print_name(Easplist, 363, style="expression"), pos=4)

## Including taxon view
text(0, 2, labels=print_name(Easplist, 363, style="expression",
	secundum="secundum"), pos=4)

## Second mention in text
text(0, 3, labels=print_name(Easplist, 363, style="expression",
	second_mention=TRUE), pos=4)

## Using synonym
text(0, 4, labels=print_name(Easplist, 50037, style="expression",
	concept=FALSE), pos=4)

## Markdown style
text(0, 5, labels=print_name(Easplist, 363, style="markdown"), pos=4)

## HTML style
text(0, 6, labels=print_name(Easplist, 363, style="html"), pos=4)



