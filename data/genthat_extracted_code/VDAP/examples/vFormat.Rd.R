library(VDAP)


### Name: vFormat
### Title: Length/Charge/Kd Peptide Calculations and File Assembly
### Aliases: vFormat
### Keywords: ~VDAP ~Formatting

### ** Examples


## vFormat on example data set ##

protEx <- data.frame(Peptides = c("PWRGPWARVGSG","GYNRVGQGSG","PNGYRSGVKGSG"),
C_6uM = c(65011.48,47462.24,24778), C_3uM = c(62637.81,31899.85,21313.67),
C_1.5uM = c(57893.22,25911.35,10397.99))

## Preformatted protEx ##

      #Peptides    C_6uM    C_3uM  C_1.5uM
#1 PWRGPWARVGSG 65011.48 62637.81 57893.22
#2   GYNRVGQGSG 47462.24 31899.85 25911.35
#3 PNGYRSGVKGSG 24778.00 21313.67 10397.99


formatEx <- vFormat(protEx,Kd = TRUE, c(6,3,1.5), 2:4)

## Formatted output ##

       #Peptide Length Charge        Kd    C_6uM    C_3uM  C_1.5uM    Std..Dev   t.value    p.value
#1 PWRGPWARVGSG     12      2 0.2572361 65011.48 62637.81 57893.22 0.008441968 30.471112 0.02088507
#2   GYNRVGQGSG     10      1 2.8239730 47462.24 31899.85 25911.35 1.619385359  1.743855 0.33146423
#3 PNGYRSGVKGSG     12      2 3.3911868 24778.00 21313.67 10397.99 2.522251940  1.344508 0.40711826




