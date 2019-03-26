library(nparLD)


### Name: ld.ci
### Title: Confidence Intervals for the Relative Treatment Effects
### Aliases: ld.ci
### Keywords: htest

### ** Examples

## Example with the "Shoulder tip pain study" data ##
data(shoulder)
attach(shoulder)
group<-paste(group1, group2, sep="")
ex.ci<-ld.ci(y=resp, time=time, subject=subject, group=group, alpha=0.05, 
time.name="Time", group.name="Group", description=FALSE, time.order=c(1,2,3,4,5,6), 
group.order=c("YF","YM","NF","NM"))
# LD CI Calculations 
# ----------------------- 
# Order of the time and group levels.
# Time level:   1 2 3 4 5 6 
# Group level:   YF YM NF NM 
# The order may be specified in time.order or group.order.

## Summary of the output
ex.ci

#     Group Time Nobs RankMeans    RTE    Bias Variance  Lower  Upper
#1  GroupYF    1   14  123.9643 0.5019  0.0008   0.1680 0.3792 0.6243
#2  GroupYF    2   14  100.2857 0.4056  0.0003   0.1366 0.3000 0.5222
#3  GroupYF    3   14   89.2500 0.3608 -0.0005   0.0979 0.2722 0.4615
#4  GroupYF    4   14  101.4643 0.4104  0.0000   0.1136 0.3131 0.5164
#5  GroupYF    5   14   72.1071 0.2911 -0.0004   0.0389 0.2351 0.3554
#6  GroupYF    6   14   84.3214 0.3407 -0.0002   0.0808 0.2605 0.4329
#7  GroupYM    1    8  107.4375 0.4347 -0.0002   0.3093 0.2786 0.6060
#8  GroupYM    2    8  113.4375 0.4591  0.0002   0.2607 0.3120 0.6142
#9  GroupYM    3    8   87.3750 0.3532  0.0001   0.1464 0.2471 0.4774
#10 GroupYM    4    8   76.6875 0.3097  0.0002   0.0873 0.2277 0.4070
#11 GroupYM    5    8   92.0625 0.3722 -0.0001   0.2011 0.2487 0.5167
#12 GroupYM    6    8   92.0625 0.3722 -0.0001   0.2011 0.2487 0.5167
#13 GroupNF    1   11  154.3636 0.6255  0.0004   0.2954 0.4500 0.7708
#14 GroupNF    2   11  174.3636 0.7068  0.0007   0.1890 0.5573 0.8188
#15 GroupNF    3   11  162.4545 0.6584 -0.0001   0.1941 0.5130 0.7768
#16 GroupNF    4   11  182.2273 0.7387  0.0007   0.1704 0.5926 0.8425
#17 GroupNF    5   11  146.8182 0.5948  0.0001   0.2383 0.4408 0.7307
#18 GroupNF    6   11  133.5000 0.5407 -0.0018   0.1531 0.4208 0.6555
#19 GroupNM    1    8  126.7500 0.5132 -0.0005   0.3339 0.3422 0.6810
#20 GroupNM    2    8  168.6250 0.6834  0.0005   0.2855 0.5021 0.8196
#21 GroupNM    3    8  176.5000 0.7154  0.0016   0.3400 0.5090 0.8555
#22 GroupNM    4    8  172.5625 0.6994  0.0013   0.3102 0.5066 0.8376
#23 GroupNM    5    8  150.0000 0.6077 -0.0003   0.3585 0.4175 0.7683
#24 GroupNM    6    8  122.8125 0.4972 -0.0025   0.2469 0.3502 0.6447



