context("read_xyData")

test_that("General tests", {
  testthat::skip_on_cran()

  ##force break (file does not exists)
  expect_type(read_xyData(file = "hi"), type = "NULL")

  ##check get_version (internal function)
  expect_type(rxylib:::get_version(), type = "character")

  ##force connection error
  expect_type(read_xyData(file = "https://github.com/R-Lum/rxylib/raw/master/tests/testdata/BkenExampleSpectrum.CNF"), type = "NULL")

  ##force wrong file format read
  expect_type(read_xyData(file = "https://raw.githubusercontent.com/R-Lum/rxylib/master/appveyor.yml"), type = "NULL")

  ##check broken testdata
  expect_type(read_xyData(file = "https://github.com/R-Lum/rxylib/raw/master/tests/testdata/BrokenExampleSpectrum.CNF"), type = "NULL")

  ##check C++ function
  expect_type(
    rxylib:::get_meta_DataSet(path = system.file("extdata/ExampleSpectrum.CNF", package = "rxylib"),
                              format_name = "canberra_cnf", options = ""),
    type = "list")

  ##check metadata argument
  expect_type(read_xyData(file = system.file("extdata/ExampleSpectrum.CNF", package = "rxylib"), metaData = FALSE), type = "list")

  ##check verbose
  expect_silent(read_xyData(file = system.file("extdata/ExampleSpectrum.CNF", package = "rxylib"), verbose =  FALSE))

  ##check plot warning (and import of spectrum)
  expect_warning(plot(read_xyData(file = system.file("extdata/TLSpectrum.xsyg", package = "rxylib"), verbose =  FALSE)))

  ##check empty data
  expect_output(print(read_xyData(file = "https://raw.githubusercontent.com/R-Lum/rxylib/master/tests/testdata/TLSpectrum_Empty.xsyg", verbose =  FALSE)))

})

test_that("Methods test", {
  testthat::skip_on_cran()

  ##check S3 methods
  test_dataset <- read_xyData(file = "https://github.com/wojdyr/xylib/raw/master/samples/03yag02.mca")
  expect_output(print(test_dataset))
  expect_silent(plot(test_dataset))
  expect_silent(plot(test_dataset, block = 1))
  expect_type(plot(test_dataset, block = 2), type = "NULL")

  test_dataset <- read_xyData(file = "https://github.com/wojdyr/xylib/raw/master/samples/background_8.CNF")

  expect_output(print(test_dataset))
  rm(test_dataset)

})

test_that("Check all formats", {
  testthat::skip_on_cran()

  ##load example data step by step from GitHub

    ##Canberra MCA
    expect_type(read_xyData(file = "https://github.com/wojdyr/xylib/raw/master/samples/03yag02.mca"), type = "list")
    expect_type(read_xyData(file = "https://github.com/wojdyr/xylib/raw/master/samples/04nacl02.mca"), type = "list")

    ##Canberra CNF
    expect_type(read_xyData(file = "https://github.com/wojdyr/xylib/raw/master/samples/SMP00011.CNF"), type = "list")
    expect_type(read_xyData(file = "https://github.com/wojdyr/xylib/raw/master/samples/background_8.CNF"), type = "list")

    ##Check ChiPlot
    expect_type(read_xyData(file = system.file("extdata/ExampleChiPlot.chi", package = "rxylib")), type = "list")

    ##Powder Diffraction CIF
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/1517474.cif"), type = "list")

    ##PI WinSpec SPE
    expect_type(read_xyData(file = "https://github.com/wojdyr/xylib/raw/master/samples/1d-1.spe"), type = "list")
    expect_type(read_xyData(file = "https://github.com/wojdyr/xylib/raw/master/samples/1d-2.spe"), type = "list")
    expect_type(read_xyData(file = "https://github.com/wojdyr/xylib/raw/master/samples/1d-3.spe"), type = "list")

    ##Siemens/Bruker RAW
    expect_type(read_xyData(file = "https://github.com/wojdyr/xylib/raw/master/samples/BT86.raw"), type = "list")
    expect_type(read_xyData(file = "https://github.com/wojdyr/xylib/raw/master/samples/Cu3Au-1.raw"), type = "list")
    expect_type(read_xyData(file = "https://github.com/wojdyr/xylib/raw/master/samples/Cu3Au-2.raw"), type = "list")
    expect_type(read_xyData(file = "https://github.com/wojdyr/xylib/raw/master/samples/format1.raw"), type = "list")

    ##Bruker ESP300-E SPC
    expect_type(read_xyData(file = "https://github.com/tzerk/ESR/raw/master/inst/extdata/mollusc.SPC"), type = "list")

    ##Bruker Diffrac-AT UXD
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/BT86_.UXD"), type = "list")

    ##Non-obious format
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/D1A5.dat"), type = "list")
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/PSI_DMC.dat"), type = "list")
    expect_type(read_xyData(file = "http://www.mx.iucr.org/iucr-top/comm/cpd/QARR/rd/cpd-1a.rd"), type = "list")

    ##Spectra / VGX 900
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/Spectra.1"), type = "list")

    ##PANalytical XRDML
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/empyrean.xrdml"), type = "list")

    ##VAMAS ISO-14976
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/mjr9_116a.vms"), type = "list")
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/mjr9_59c.vms"), type = "list")
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/mjr9_64c.vms"), type = "list")

    ##SPECS SpecsLab2 xy
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/mm-specs.xy"), type = "list")
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/specsxy_example.xy"), type = "list")

    ##TXT
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/pesa.txt"), type = "list")
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/with_commas.txt"), type = "list")
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/with_sigma.txt"), type = "list")
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/xy_text.txt"), type = "list")

    ##CSV or TSV
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/small.tsv"), type = "list")
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/test1.csv"), type = "list")
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/test2.csv"), type = "list")
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/test3.csv"), type = "list")
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/test4.csv"), type = "list")

    ##Freiberg Instruments (FI) Lexsyg
    expect_type(read_xyData(file = "https://raw.githubusercontent.com/wojdyr/xylib/master/samples/rfqm_uv.xsyg"), type = "list")

    ##XFIT XDD
    ##commented 2017-11-03 ... server down?
    #expect_type(read_xyData(file = "http://www.ccp14.ac.uk/ccp/ccp14/ftp-mirror/krumm/Software/windows/stereo/Y2O3.XDD"), type = "list")

    ##Philips UDF
    ##commented 2017-11-03 ... server down?
    #expect_type(read_xyData(file = "http://www.ccp14.ac.uk/ccp/ccp14/ftp-mirror/krumm/Software/windows/winfit/Winfit/ZEOLITE.UDF"), type = "list")

    ##DBWS data
    expect_type(read_xyData("http://mysite.du.edu/~balzar/lebailbr.dbw"), type = "list")

    ##Rigaku (dat)
    expect_type(read_xyData("https://raw.githubusercontent.com/R-Lum/rxylib/master/tests/testdata/ExampleRigaku.dat"), type = "list")

    ##Sietronics Sieray CPI detected
    expect_type(read_xyData("https://cbc-wb01x.chemistry.ohio-state.edu/~woodward/ceo2br.cpi"), type = "list")

})

