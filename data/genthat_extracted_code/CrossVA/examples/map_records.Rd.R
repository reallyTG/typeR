library(CrossVA)


### Name: map_records
### Title: Map VA records to coding algorithm.
### Aliases: map_records

### ** Examples


record_f_name <- system.file('sample', 'who_va_output.csv', package = 'CrossVA')
records <- read.csv(record_f_name)
output_data <- map_records(records, 'insilicova')
output_f_name <- "output_for_insilicova.csv"
write.table(
output_data,
output_f_name,
row.names = FALSE,
na = "",
qmethod = "escape",
sep = ","
)
mapping_file <- system.file('mapping', 'interva4_mapping.txt', package = 'CrossVA')
output_data <- map_records(records, mapping_file)
output_f_name <- "output_for_interva4.csv"
write.table(
output_data,
output_f_name,
row.names = FALSE,
na = "",
qmethod = "escape",
sep = ","
)




