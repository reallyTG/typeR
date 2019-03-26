library(rstatscn)


### Name: statscnQueryData
### Title: query data in the statscn db
### Aliases: statscnQueryData

### ** Examples

df=statscnQueryData('A0201',dbcode='hgnd')
df=statscnQueryData('A0201',dbcode='fsnd',rowcode='zb',colcode='sj',
                    moreWd=list(name='reg',value='110000'))



