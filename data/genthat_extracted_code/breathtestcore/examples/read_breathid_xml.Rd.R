library(breathtestcore)


### Name: read_breathid_xml
### Title: Read new BreathID/Examens XML file
### Aliases: read_breathid_xml

### ** Examples

filename = btcore_file("NewBreathID_01.xml")
# Show first lines
cat(readLines(filename, n = 10), sep="\n")
bid = read_breathid_xml(filename)
# List with length 1
str(bid, 1)
filename = btcore_file("NewBreathID_multiple.xml")
bids = read_breathid_xml(filename)
str(bids, 1) # 3 elements - the others in the file have no data
# Create hook function to deselect first record
choose_record = function(records) {
  r  = rep(TRUE, length(records))
  r[1] = FALSE
  r
}
options(breathtestcore.choose_record = choose_record)
bids = read_breathid_xml(filename)
str(bids, 1) # 2 elements, first deselected





