library(getTBinR)


### Name: get_data
### Title: Generic Get Data Function
### Aliases: get_data

### ** Examples


tb_burden <- get_data(url = "https://extranet.who.int/tme/generateCSV.asp?ds=estimates",
save_name = "TB_burden")

head(tb_burden)




