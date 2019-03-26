library(ddpcr)


### Name: subset.ddpcr_plate
### Title: Subsetting a ddPCR plate
### Aliases: subset.ddpcr_plate

### ** Examples

plate <- new_plate(sample_data_dir())
plate %>% wells_used
plate %>% subset("C01") %>% wells_used
plate %>% subset(c("C01", "F05")) %>% wells_used
plate %>% subset("C01, F05") %>% wells_used
plate %>% subset("C01:F05") %>% wells_used
plate %>% subset("C01:F05, A01") %>% wells_used
plate %>% subset("A01:C03") %>% wells_used
plate %>% subset("A01:C05") %>% wells_used
plate %>% subset("A01, A05:F05") %>% wells_used
plate %>% subset("A01, A05:C05, F05") %>% wells_used
plate %>% subset("A01:A05, C01:C05, F05") %>% wells_used
plate %>% subset(samples = "Dean") %>% wells_used
plate %>% subset(samples = c("Dean", "Mike")) %>% wells_used



