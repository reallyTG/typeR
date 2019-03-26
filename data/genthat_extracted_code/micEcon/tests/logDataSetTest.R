library( "micEcon" )
data( "germanFarms" )

# add logical variable
germanFarms$landAboveAvg <- germanFarms$land > mean( germanFarms$land )

datLog1 <- logDataSet( germanFarms, c( "vAnimal", "vOutput", "vVarInput" ) )
summary( datLog1 )

datLog2 <- logDataSet( germanFarms, c( "vAnimal", "vOutput" ),
   c( "year", "vVarInput" ) )
summary( datLog2 )
all.equal( datLog1, datLog2[ , -3 ] )

datLog3 <- logDataSet( germanFarms, c( "vAnimal", "vOutput", "landAboveAvg" ) )
summary( datLog3 )

datLog4 <- logDataSet( germanFarms, c( "vAnimal", "vOutput" ),
   c( "landAboveAvg", "vVarInput" ) )
summary( datLog4 )
all.equal( datLog1, datLog4[ , -3 ] )


try( logDataSet( germanFarms, c( "year", "vOutput", "vVarInput" ) ) )

try( logDataSet( germanFarms, c( "abc", "vOutput", "vVarInput" ) ) )
