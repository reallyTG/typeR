library(rtsdata)


### Name: ds.storage.file.csv.save
### Title: Save 'xts' object into CSV file
### Aliases: ds.storage.file.csv.save

### ** Examples

 # get sample of the fake stock data
 data = ds.getSymbol.fake.stock.data('dummy', from = '2018-02-01', to = '2018-02-13')
 filename = file.path(tempdir(), 'dummy.csv')
 ds.storage.file.csv.save(data, filename)




