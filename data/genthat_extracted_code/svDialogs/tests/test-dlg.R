context("Dialogs-General")

describe("satellite functions", {
  it("checks if R is run under JGR or RStudio", {
    expect_identical(.is_jgr(), "package:JGR" %in% search())
    expect_identical(.is_rstudio(), rstudioapi::isAvailable())
  })

  it("manipulates data in a temporary environment", {
    expect_identical(.temp_env(), as.environment("SciViews:TempEnv"))
    expect_identical(.assign_temp(".test_variable", 1:10), 1:10)
    expect_identical(.get_temp(".test_variable"), 1:10)
    expect_identical(.get_temp(".nonexisting_variable", default = "a"), "a")
    rm(list = ".test_variable", envir = .temp_env())
    expect_identical(.get_temp(".test_variable", default = "a"), "a")
  })

  it("has a default GUI available named .GUI", {
    expect_true(".GUI" %in% gui_list())
    expect_s3_class(.GUI, c("nativeGUI", "textCLI", "gui", "environment"))
  })

  it("creates a second GUI with only textCLI", {
    gui_add("CLI", widgets = "textCLI", ask = FALSE)
    expect_true("CLI" %in% gui_list())
    expect_s3_class(.GUI, c("textCLI", "gui", "environment"))
  })

  it("creates a third GUI with no widgets", {
    gui_add("NONE", widgets = NULL, ask = NULL)
    expect_true("NONE" %in% gui_list())
    expect_s3_class(NONE, c("gui", "environment"))
  })
})


context("Dialogs-dir")

describe("dlg_dir works in non-interactive sessions", {
  wd <- getwd()
  if (.Platform$OS.type == "windows") wd <- gsub("\\\\", "/", wd)
  td <- tempdir()
  if (.Platform$OS.type == "windows") td <- gsub("\\\\", "/", td)

  it("returns the default dir in non interactive session", {
    expect_identical(dlg_dir()$res, wd)
    expect_identical(dlg_dir(title = "test")$res, wd)
    expect_identical(dlg_dir(title = "")$res, wd)
    expect_identical(dlg_dir(title = character(0))$res, wd)
    expect_identical(dlg_dir(title = NULL)$res, wd)
    expect_identical(dlg_dir(default = wd)$res, wd)
    expect_identical(dlg_dir(default = td)$res, td)
    expect_identical(dlg_dir(gui = CLI)$res, wd)
    expect_identical(dlg_dir(title = "test", gui = CLI)$res, wd)
    expect_identical(dlg_dir(default = wd, gui = CLI)$res, wd)
    expect_identical(dlg_dir(gui = NONE)$res, wd)
  })

  it("proposes to create a new directory", {
    newdir <- file.path(tempdir(), "test_directory")
    expect_identical(dlg_dir(default = newdir)$res, newdir)
  })

  # TODO: this works well on MacOS, but not on Linux or Windows, why???
  #it("runs dlgDir.gui in \"forced\" interactive mode", {
  #  options(SciViews.force.interactive = TRUE) # DON'T use this is real life!
  #  expect_error(dlg_dir(default = wd, gui = NONE),
  #    "No workable method available to display a dir selection dialog box",
  #    fixed = FALSE)
  #  expect_identical(NONE$res, NA)
  #  expect_equivalent(NONE$status, "error")
  #  expect_identical(NONE$widgets, "none")
  #  expect_identical(NONE$args$title, "Choose a directory")
  #  expect_identical(NONE$args$default, wd)
  #  expect_error(dlg_dir(default = wd, title = "test", gui = NONE),
  #    "No workable method available to display a dir selection dialog box",
  #    fixed = FALSE)
  #  expect_identical(NONE$res, NA)
  #  expect_equivalent(NONE$status, "error")
  #  expect_identical(NONE$widgets, "none")
  #  expect_identical(NONE$args$title, "test")
  #  expect_identical(NONE$args$default, wd)
  #  options(SciViews.force.interactive = NULL) # Remove this option quickly
  #})

  # TODO: check the creation of a new sub-directory, or even sub-sub-directory
})
