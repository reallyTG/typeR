library(BTR)


### Name: model_train
### Title: Training Model
### Aliases: model_train

### ** Examples

data(wilson_raw_data)
cdata = initialise_raw_data(wilson_raw_data, max_expr = 'low')

#select only relevant cells.
cell_ind = grepl('cmp', rownames(cdata)) | grepl('gmp', rownames(cdata)) 
fcdata = cdata[cell_ind,]

#select genes to be included.
gene_ind = c('fli1', 'gata1', 'gata2', 'gfi1', 'scl', 'sfpi1') 
fcdata = fcdata[, gene_ind]

final_model = model_train(cdata=fcdata, max_varperrule=2)
plotBM(final_model)




