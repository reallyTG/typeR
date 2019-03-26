library(idm)


### Name: update.i_mca
### Title: Updates a Multiple Correspondence Analysis solution
### Aliases: update.i_mca

### ** Examples

data(women, package = "idm")
dat = women[,c(1:4)]
res_MCA = i_mca(dat[1:300,])
aa = seq(from = 301, to = nrow(women), by = 200)
aa[length(aa)] = nrow(dat)+1
for (k in c(1:(length(aa)-1)))
{
  res_MCA = update(res_MCA,dat[c((aa[k]):(aa[k+1]-1)),])
}
plot(res_MCA, what = c(FALSE, TRUE), animation = FALSE)



