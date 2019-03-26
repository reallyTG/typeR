library(rtsdata)


### Name: ds.storage.file.csv.load
### Title: Load data from CSV file into 'xts' object
### Aliases: ds.storage.file.csv.load

### ** Examples

 # get sample of the fake stock data
 data = ds.getSymbol.fake.stock.data('dummy', from = '2018-02-01', to = '2018-02-13')
 filename = file.path(tempdir(), 'dummy.csv')
 ds.storage.file.csv.save(data, filename)
 ds.storage.file.csv.load(filename)




