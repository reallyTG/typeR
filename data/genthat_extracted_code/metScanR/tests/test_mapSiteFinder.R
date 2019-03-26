test_that("Test mapSiteFinder",{
    skip_on_cran()
    ############### EXPECT PASS #############################
    #testing bug that D Durden found on 11/3/17
    #test 1 network
    outPass1a <- mapSiteFinder(getNetwork(network="NADP"))
    expect_is(outPass1a, 'leaflet')
    outPass1b <- mapSiteFinder(getNetwork(network="Ameriflux"))
    expect_is(outPass1b, 'leaflet')
    #test 2 networks
    outPass2 <- mapSiteFinder(getNetwork(network=c("NADP","Ameriflux")))
    expect_is(outPass2, 'leaflet')
    #test 3 networks
    outNetwork3 <- mapSiteFinder(getNetwork(network=c("NADP","Ameriflux","NEON")))
    expect_is(outNetwork3, 'leaflet')

    ############### EXPECT FAIL#############################
    #enter non existing network, i.e., misspelled network name
    expect_error(mapSiteFinder(getNetwork(network="NDAP")),"subscript out of bounds")
    #non-existing country (misspelled)
    expect_error(mapSiteFinder(getCountry(country="Cananada")),"subscript out of bounds")

    ############### New tests post bug find 2019-01-31 ##############
    #getNearby tests
    outPassNearby1 <- getNearby(siteID="NEON:CPER", radius=10)
    expect_is(outPassNearby1, "list")
    expect_length(outPassNearby1, 5)

    outPassNearby2<-getNearby(lat=41.7821, lon = -71.4204, radius=40)
    #no sites until 35 km away with base DB; when user has ful database this can be run with smaller radius
    expect_is(outPassNearby2, "list")
    expect_length(outPassNearby2, 1)

    #getTerritory test
    outPassTerritory<-getTerritory(territory = "RI")
    expect_is(outPassTerritory, "list")
    expect_length(outPassTerritory, 1)

    #get Network test:
    #This should return a length of 0 because the correct network for SCAN is actually NRCS
    outPassNetwork1<-getNetwork(network="SCAN")
    expect_length(outPassNetwork1, 0)
    #This should return the total number of NRCS sites in the nominal DB (n=4304)
    outPassNetwork2<-getNetwork(network="NRCS")
    expect_length(outPassNetwork2, 4304)

    #getId tests:
    outPassId<-getId(id = "WBAN")
    expect_length(outPassId, 329)

    #getVars test:
    outPassVars<-getVars(vars = "snow depth",startVarsDate = "1970-01-01",endVarsDate = "1985-05-10")
    expect_length(outPassVars, 23)

    #getCountry test:
    #this should return 0 with the nominal package because stations from outside of North America aren't in there
    outPassCountry1<-getCountry(country=c("Italy","Portugal"))
    expect_length(outPassCountry1, 0)

    #This should return 5050 sites in US (nominal package)
    outPassCountry2<-getCountry(country=c("United States"))
    expect_length(outPassCountry2, 5050)

    #getDates test:
    #should return
    outPassDates<-getDates(startDate="1940-01-01",endDate = "1970-04-18")
    expect_length(outPassDates, 471)

    #getElevation test:
    outPassElevation<-getElevation(elevMin=1500)
    expect_length(outPassElevation,3067)

    #getStations tests:
    #should return length of 0 because it's not a real station
    outPassStation1<-getStation(siteID="NEON:ZZSX")
    expect_length(outPassStation1,0)
    #should return length of 1:
    outPassStation2<-getStation(siteID="NEON:CPER")
    expect_length(outPassStation2,1)


})
