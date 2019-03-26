library(Rdpack)


### Name: Rdo_get_item_labels
### Title: Get the labels of items in an Rd object
### Aliases: Rdo_get_item_labels
### Keywords: RdoProgramming

### ** Examples

infile <- system.file("examples", "tz.Rd", package = "Rdpack")
rd <- tools::parse_Rd(infile)

## get item labels found anywhere in the Rd object
(items <- Rdo_get_item_labels(rd))

## search only in section "arguments" (i.e., get argument names)
## (note [[1]] - there is only one arguments section)
pos.args <- Rdo_locate_core_section(rd, "\\arguments")[[1]]
(args <- Rdo_get_item_labels(rd[[pos.args$pos]]))

## search only in section "value"
pos.val <- Rdo_locate_core_section(rd, "\\value")[[1]]
(vals <- Rdo_get_item_labels(rd[[pos.val$pos]]))

## There are no other items in 'rd', so this gives TRUE:
all.equal(items, c(args, vals)) # TRUE



