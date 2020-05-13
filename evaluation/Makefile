MKDIR := mkdir -p
RM := rm

CXX := g++
CXXFLAGS := --std=c++17 -O2 -ggdb3

R := R

R_DIRPATH := R
SRC_DIRPATH := src
BIN_DIRPATH := bin
DATA_DIRPATH := data
HTML_DIRPATH := html
TYPE_ANALYSIS_DIRPATH := $(DATA_DIRPATH)/type-analysis
PACKAGE_TYPE_ANALYSIS_DIRPATH := $(DATA_DIRPATH)/type-analysis/package
MERGED_TYPE_ANALYSIS_DIRPATH := $(DATA_DIRPATH)/type-analysis/merged
MERGED_TYPE_ANALYSIS_FILEPATH := $(DATA_DIRPATH)/type-analysis/merged/merged.csv
MERGE_TYPE_ANALYSIS_SCRIPT := $(R_DIRPATH)/merge-type-analysis.R
TYPE_ANALYSIS_EVALUATION_NOTEBOOK := $(R_DIRPATH)/evaluate-type-analysis.Rmd
TYPE_ANALYSIS_EVALUATION_DOCUMENT := $(HTML_DIRPATH)/evaluate-type-analysis.html

TASTR_DIRPATH := $(realpath ../../tastr)
TASTR_INCLUDE_PATH := $(TASTR_DIRPATH)/build/include
TASTR_LIBRARY_PATH := $(TASTR_DIRPATH)/build/lib

SRC_FILES = $(shell find $(SRC_DIRPATH) -name "*.cpp") $(shell find $(SRC_DIRPATH) -name "*.hpp")

TYPE_ANALYZER := $(BIN_DIRPATH)/type-analyzer

TYPEDECLARATION_COMMAND = R --slave -q -e "cat(system.file('TYPEDECLARATION', package='contractr'))"


$(TYPE_ANALYZER): $(SRC_FILES)
	$(MKDIR) $(BIN_DIRPATH)
	$(CXX) $(CXXFLAGS) -I$(TASTR_INCLUDE_PATH) -I$(TASTR_INCLUDE_PATH)/tastr $^ $(TASTR_LIBRARY_PATH)/libtastr.a -o$@

type-analyzer: $(TYPE_ANALYZER)

typedeclaration-location:
	@R --slave -q -e "cat(system.file('TYPEDECLARATION', package='contractr'))"

analyze-package-types: type-analyzer
	$(RM) -f $(PACKAGE_TYPE_ANALYSIS_DIRPATH)/*
	$(MKDIR) $(PACKAGE_TYPE_ANALYSIS_DIRPATH)
	@for file in `$(TYPEDECLARATION_COMMAND)`/*;                                         \
	do                                                                                   \
	    echo "Analyzing '$$file'";                                                       \
	    $(TYPE_ANALYZER) $$file $(PACKAGE_TYPE_ANALYSIS_DIRPATH)/`basename $$file`.csv;  \
	done

merge-package-type-analysis:
	$(RM) -f $(MERGED_TYPE_ANALYSIS_DIRPATH)/*
	$(MKDIR) $(MERGED_TYPE_ANALYSIS_DIRPATH)
	$(R) --slave -q --file=$(MERGE_TYPE_ANALYSIS_SCRIPT) --args $(PACKAGE_TYPE_ANALYSIS_DIRPATH) $(MERGED_TYPE_ANALYSIS_FILEPATH)

evaluate-type-analysis:
	$(MKDIR) $(HTML_DIRPATH)
	$(R) --slave -q -e "rmarkdown::render('$(shell realpath $(TYPE_ANALYSIS_EVALUATION_NOTEBOOK))', output_dir='$(shell realpath $(HTML_DIRPATH))', output_file='$(shell basename $(TYPE_ANALYSIS_EVALUATION_DOCUMENT))', params=list(type_analysis_datafile = '$(shell realpath $(MERGED_TYPE_ANALYSIS_FILEPATH))'))"
