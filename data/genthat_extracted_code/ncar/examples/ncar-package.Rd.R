library(ncar)


### Name: ncar-package
### Title: Noncompartmental Analysis for Pharmacokinetic Report
### Aliases: ncar-package ncar
### Keywords: package NCA

### ** Examples

# Theoph and Indometh data: dose in mg, conc in mg/L, time in h

# Output to PDF file
#pdfNCA(fileName="NCA-Theoph.pdf", Theoph, key="Subject", colTime="Time",
#       colConc="conc", dose=320, doseUnit="mg", timeUnit="h", concUnit="mg/L")
#pdfNCA(fileName="NCA-Theoph.pdf", Theoph, key=c("Subject", "Wt"), colTime="Time",
#       colConc="conc", dose=320, doseUnit="mg", timeUnit="h", concUnit="mg/L")
#pdfNCA(fileName="NCA-Indometh.pdf", Indometh, key="Subject", colTime="time",
#       colConc="conc", adm="Infusion", dur=0.5, dose=25, doseUnit="mg",
#       timeUnit="h", concUnit="mg/L")


# Output to RTF file
#rtfNCA(fileName="NCA-Theoph.rtf", Theoph, key="Subject", colTime="Time",
#       colConc="conc", dose=320, doseUnit="mg", timeUnit="h", concUnit="mg/L")
#rtfNCA(fileName="NCA-Theoph.rtf", Theoph, key=c("Subject", "Wt"), colTime="Time",
#       colConc="conc", dose=320, doseUnit="mg", timeUnit="h", concUnit="mg/L")
#rtfNCA(fileName="NCA-Indometh.rtf", Indometh, key="Subject", colTime="time",
#       colConc="conc", adm="Infusion", dur=0.5, dose=25, doseUnit="mg",
#       timeUnit="h", concUnit="mg/L")



