library(webchem)


### Name: cs_convert
### Title: Convert identifiers using ChemSpider
### Aliases: cs_convert

### ** Examples

## No test: 
# might fail if API is not available
cs_convert('BQJCRHHNABKAKU-KBQPJGBKSA-N', from = 'inchikey', to = 'csid')
cs_convert(c('BQJCRHHNABKAKU-KBQPJGBKSA-N', 'BQJCRHHNABKAKU-KBQPJGBKSA-N'),
    from = 'inchikey', to = 'csid')
cs_convert('BQJCRHHNABKAKU-KBQPJGBKSA-N', from = 'inchikey', to = 'inchi')
cs_convert('BQJCRHHNABKAKU-KBQPJGBKSA-N', from = 'inchikey', to = 'mol')
## End(No test)



