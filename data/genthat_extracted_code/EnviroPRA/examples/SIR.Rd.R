library(EnviroPRA)


### Name: SIR
### Title: Chemical intake by accidental soil ingestion
### Aliases: SIR
### Keywords: methods

### ** Examples


# Ingestion rate for a children weighing 20 Kg who ingest 200 mg 
# of soil every day, 250 days per year during 10 years. 95-UCL of
# Arsenic in soil is 25 mg/Kg

# Carcinogenic effects

SIR ( CS = 25, BW = 20, IR = 200, ED = 10, EF = 250)

# Systemic effects

SIR ( CS = 25, BW = 20, IR = 200, ED = 10, EF = 250, AT = 365*10)



