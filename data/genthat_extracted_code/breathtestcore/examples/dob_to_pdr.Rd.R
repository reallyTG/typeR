library(breathtestcore)


### Name: dob_to_pdr
### Title: Convert breath test DOB data to PDR data
### Aliases: dob_to_pdr

### ** Examples

filename = btcore_file("350_20049_0_GERWithWeight.txt")
bid = read_breathid(filename)
bid$data$pdr1 = dob_to_pdr(bid$data$dob, weight=bid$weight, height=bid$height)

plot(bid$data$minute, bid$data$pdr1, main="points: from breath_id; line: computed",
type="l")
points(bid$data$minute, bid$data$pdr,col="red",type="p",pch=16)
#
# Check how far our computed pdr is from the stored pdr
var(bid$data$pdr1-bid$data$pdr)



